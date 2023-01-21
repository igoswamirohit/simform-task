import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'converters.dart';

import '../models/user_response.dart';

part 'users_table.g.dart';

//Class which defines table's structure
class Users extends Table {
  TextColumn get id => text().map(const IdConverter()).nullable()();

  TextColumn get name => text().map(const NameConverter()).nullable()();

  TextColumn get picture => text().map(const PictureConverter()).nullable()();

  TextColumn get location => text().map(const LocationConverter()).nullable()();

  TextColumn get dob => text().map(const DobConverter()).nullable()();

  TextColumn get phone => text().withLength(max: 20)();

  TextColumn get cell => text().withLength(max: 20)();

  TextColumn get nationality => text().withLength(max: 50)();

  TextColumn get email => text()();

  TextColumn get gender => text().withLength(max: 20)();
}

@DriftDatabase(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  deleteAllUsers() async {
    await batch((batch) => batch.deleteAll(users));
  }

  //Function to Insert all users list in db
  insertAllUsers(List<RemoteUser> remoteUsers) async {
    await batch((batch) => batch.insertAll(
        users,
        remoteUsers
            .map<UsersCompanion>(
              (user) => userToCompanion(user),
            )
            .toList())).catchError((error) {
      log(error.toString());
    });
  }

  //Function to get list of users from DB
  Future<List<User>> getAllUsers() async {
    return await select(users).get();
  }

  //Function to update local db with remote data
  updateAllUsers(List<RemoteUser> remoteUsers) async {
    // Update Statement is not working due to some reasons need to debug

    /*batch((batch) => batch.replaceAll<Users, User>(
        users,
        remoteUsers
            .map<UsersCompanion>(
              (user) => userToCompanion(user),
            )
            .toList()));*/

    // Using alternate solution
    await transaction(() async {
      //deleting all the rows and then inserting all again
      await batch((batch) => batch.deleteAll(users));
      await insertAllUsers(remoteUsers);
      // await batch((batch) => batch.insertAll(
      //     users, remoteUsers.map((user) => userToCompanion(user))));
    }).catchError((error) {
      log(error.toString());
    });
  }
}

//Open Connection with Offline DB
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

//Function to convert RemoteUser to UserCompanion
UsersCompanion userToCompanion(RemoteUser user) {
  return UsersCompanion(
    id: Value(user.id),
    name: Value(user.name),
    dob: Value(user.dob),
    location: Value(user.location),
    cell: Value(user.cell ?? ''),
    phone: Value(user.phone ?? ''),
    gender: Value(user.gender ?? ''),
    email: Value(user.email ?? ''),
    nationality: Value(user.nat ?? ''),
    picture: Value(user.picture),
  );
}
