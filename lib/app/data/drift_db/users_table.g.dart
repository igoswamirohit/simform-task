// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_table.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumnWithTypeConverter<Id?, String> id =
      GeneratedColumn<String>('id', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Id?>($UsersTable.$converteridn);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumnWithTypeConverter<Name?, String> name =
      GeneratedColumn<String>('name', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Name?>($UsersTable.$converternamen);
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumnWithTypeConverter<Picture?, String> picture =
      GeneratedColumn<String>('picture', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Picture?>($UsersTable.$converterpicturen);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumnWithTypeConverter<Location?, String> location =
      GeneratedColumn<String>('location', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Location?>($UsersTable.$converterlocationn);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumnWithTypeConverter<Dob?, String> dob =
      GeneratedColumn<String>('dob', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Dob?>($UsersTable.$converterdobn);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cellMeta = const VerificationMeta('cell');
  @override
  late final GeneratedColumn<String> cell = GeneratedColumn<String>(
      'cell', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nationalityMeta =
      const VerificationMeta('nationality');
  @override
  late final GeneratedColumn<String> nationality = GeneratedColumn<String>(
      'nationality', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        picture,
        location,
        dob,
        phone,
        cell,
        nationality,
        email,
        gender
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_idMeta, const VerificationResult.success());
    context.handle(_nameMeta, const VerificationResult.success());
    context.handle(_pictureMeta, const VerificationResult.success());
    context.handle(_locationMeta, const VerificationResult.success());
    context.handle(_dobMeta, const VerificationResult.success());
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('cell')) {
      context.handle(
          _cellMeta, cell.isAcceptableOrUnknown(data['cell']!, _cellMeta));
    } else if (isInserting) {
      context.missing(_cellMeta);
    }
    if (data.containsKey('nationality')) {
      context.handle(
          _nationalityMeta,
          nationality.isAcceptableOrUnknown(
              data['nationality']!, _nationalityMeta));
    } else if (isInserting) {
      context.missing(_nationalityMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: $UsersTable.$converteridn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])),
      name: $UsersTable.$converternamen.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])),
      picture: $UsersTable.$converterpicturen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture'])),
      location: $UsersTable.$converterlocationn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])),
      dob: $UsersTable.$converterdobn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dob'])),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      cell: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cell'])!,
      nationality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nationality'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static TypeConverter<Id, String> $converterid = const IdConverter();
  static TypeConverter<Id?, String?> $converteridn =
      NullAwareTypeConverter.wrap($converterid);
  static TypeConverter<Name, String> $convertername = const NameConverter();
  static TypeConverter<Name?, String?> $converternamen =
      NullAwareTypeConverter.wrap($convertername);
  static TypeConverter<Picture, String> $converterpicture =
      const PictureConverter();
  static TypeConverter<Picture?, String?> $converterpicturen =
      NullAwareTypeConverter.wrap($converterpicture);
  static TypeConverter<Location, String> $converterlocation =
      const LocationConverter();
  static TypeConverter<Location?, String?> $converterlocationn =
      NullAwareTypeConverter.wrap($converterlocation);
  static TypeConverter<Dob, String> $converterdob = const DobConverter();
  static TypeConverter<Dob?, String?> $converterdobn =
      NullAwareTypeConverter.wrap($converterdob);
}

class User extends DataClass implements Insertable<User> {
  final Id? id;
  final Name? name;
  final Picture? picture;
  final Location? location;
  final Dob? dob;
  final String phone;
  final String cell;
  final String nationality;
  final String email;
  final String gender;
  const User(
      {this.id,
      this.name,
      this.picture,
      this.location,
      this.dob,
      required this.phone,
      required this.cell,
      required this.nationality,
      required this.email,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      final converter = $UsersTable.$converteridn;
      map['id'] = Variable<String>(converter.toSql(id));
    }
    if (!nullToAbsent || name != null) {
      final converter = $UsersTable.$converternamen;
      map['name'] = Variable<String>(converter.toSql(name));
    }
    if (!nullToAbsent || picture != null) {
      final converter = $UsersTable.$converterpicturen;
      map['picture'] = Variable<String>(converter.toSql(picture));
    }
    if (!nullToAbsent || location != null) {
      final converter = $UsersTable.$converterlocationn;
      map['location'] = Variable<String>(converter.toSql(location));
    }
    if (!nullToAbsent || dob != null) {
      final converter = $UsersTable.$converterdobn;
      map['dob'] = Variable<String>(converter.toSql(dob));
    }
    map['phone'] = Variable<String>(phone);
    map['cell'] = Variable<String>(cell);
    map['nationality'] = Variable<String>(nationality);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      phone: Value(phone),
      cell: Value(cell),
      nationality: Value(nationality),
      email: Value(email),
      gender: Value(gender),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<Id?>(json['id']),
      name: serializer.fromJson<Name?>(json['name']),
      picture: serializer.fromJson<Picture?>(json['picture']),
      location: serializer.fromJson<Location?>(json['location']),
      dob: serializer.fromJson<Dob?>(json['dob']),
      phone: serializer.fromJson<String>(json['phone']),
      cell: serializer.fromJson<String>(json['cell']),
      nationality: serializer.fromJson<String>(json['nationality']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<Id?>(id),
      'name': serializer.toJson<Name?>(name),
      'picture': serializer.toJson<Picture?>(picture),
      'location': serializer.toJson<Location?>(location),
      'dob': serializer.toJson<Dob?>(dob),
      'phone': serializer.toJson<String>(phone),
      'cell': serializer.toJson<String>(cell),
      'nationality': serializer.toJson<String>(nationality),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
    };
  }

  User copyWith(
          {Value<Id?> id = const Value.absent(),
          Value<Name?> name = const Value.absent(),
          Value<Picture?> picture = const Value.absent(),
          Value<Location?> location = const Value.absent(),
          Value<Dob?> dob = const Value.absent(),
          String? phone,
          String? cell,
          String? nationality,
          String? email,
          String? gender}) =>
      User(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        picture: picture.present ? picture.value : this.picture,
        location: location.present ? location.value : this.location,
        dob: dob.present ? dob.value : this.dob,
        phone: phone ?? this.phone,
        cell: cell ?? this.cell,
        nationality: nationality ?? this.nationality,
        email: email ?? this.email,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('location: $location, ')
          ..write('dob: $dob, ')
          ..write('phone: $phone, ')
          ..write('cell: $cell, ')
          ..write('nationality: $nationality, ')
          ..write('email: $email, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, picture, location, dob, phone, cell,
      nationality, email, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.picture == this.picture &&
          other.location == this.location &&
          other.dob == this.dob &&
          other.phone == this.phone &&
          other.cell == this.cell &&
          other.nationality == this.nationality &&
          other.email == this.email &&
          other.gender == this.gender);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<Id?> id;
  final Value<Name?> name;
  final Value<Picture?> picture;
  final Value<Location?> location;
  final Value<Dob?> dob;
  final Value<String> phone;
  final Value<String> cell;
  final Value<String> nationality;
  final Value<String> email;
  final Value<String> gender;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.picture = const Value.absent(),
    this.location = const Value.absent(),
    this.dob = const Value.absent(),
    this.phone = const Value.absent(),
    this.cell = const Value.absent(),
    this.nationality = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.picture = const Value.absent(),
    this.location = const Value.absent(),
    this.dob = const Value.absent(),
    required String phone,
    required String cell,
    required String nationality,
    required String email,
    required String gender,
  })  : phone = Value(phone),
        cell = Value(cell),
        nationality = Value(nationality),
        email = Value(email),
        gender = Value(gender);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? picture,
    Expression<String>? location,
    Expression<String>? dob,
    Expression<String>? phone,
    Expression<String>? cell,
    Expression<String>? nationality,
    Expression<String>? email,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (picture != null) 'picture': picture,
      if (location != null) 'location': location,
      if (dob != null) 'dob': dob,
      if (phone != null) 'phone': phone,
      if (cell != null) 'cell': cell,
      if (nationality != null) 'nationality': nationality,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
    });
  }

  UsersCompanion copyWith(
      {Value<Id?>? id,
      Value<Name?>? name,
      Value<Picture?>? picture,
      Value<Location?>? location,
      Value<Dob?>? dob,
      Value<String>? phone,
      Value<String>? cell,
      Value<String>? nationality,
      Value<String>? email,
      Value<String>? gender}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      location: location ?? this.location,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      cell: cell ?? this.cell,
      nationality: nationality ?? this.nationality,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      final converter = $UsersTable.$converteridn;
      map['id'] = Variable<String>(converter.toSql(id.value));
    }
    if (name.present) {
      final converter = $UsersTable.$converternamen;
      map['name'] = Variable<String>(converter.toSql(name.value));
    }
    if (picture.present) {
      final converter = $UsersTable.$converterpicturen;
      map['picture'] = Variable<String>(converter.toSql(picture.value));
    }
    if (location.present) {
      final converter = $UsersTable.$converterlocationn;
      map['location'] = Variable<String>(converter.toSql(location.value));
    }
    if (dob.present) {
      final converter = $UsersTable.$converterdobn;
      map['dob'] = Variable<String>(converter.toSql(dob.value));
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (cell.present) {
      map['cell'] = Variable<String>(cell.value);
    }
    if (nationality.present) {
      map['nationality'] = Variable<String>(nationality.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('location: $location, ')
          ..write('dob: $dob, ')
          ..write('phone: $phone, ')
          ..write('cell: $cell, ')
          ..write('nationality: $nationality, ')
          ..write('email: $email, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
