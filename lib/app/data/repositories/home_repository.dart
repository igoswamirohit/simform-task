import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as getx;
import '../models/user_response.dart';
import '../../../network/api_helper.dart';
import '../../../utility/api_constants.dart';

import '../drift_db/users_table.dart';

class HomeRepository {
  final db = getx.Get.find<MyDatabase>();

  Future<Response> fetchRemoteUsers() async {
    final apiHelper = LinkToOutSideWorld();
    return await apiHelper.request(
      url: ApiConstants.users,
      method: GET,
      params: {'results': '100'},
      showLoader: true,
    );
  }

  Future<List<User>> fetchLocalUsers() async => await db.getAllUsers();

  deleteAllUsers() async => await db.deleteAllUsers();

  insertAllUsers(List<RemoteUser> users) async =>
      await db.insertAllUsers(users);

  updateAllUsers(List<RemoteUser> users) async =>
      await db.updateAllUsers(users);
}
