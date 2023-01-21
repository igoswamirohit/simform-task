import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../../utility/enums.dart';
import '../../../../utility/general_util.dart';
import '../../../core/app_controller.dart';
import '../../../data/models/user_response.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final isRemoteDataFetched = RxBool(false);
  final users = Rx<List<RemoteUser>?>(null);

  final _appController = Get.find<AppController>();

  final HomeRepository _repository;

  @override
  void onReady() {
    super.onReady();

    //fetch data from local db
    fetchUsers(DataSource.local);

    //Listen to connectivity changes
    _appController.connectivity.listen((connectivity) {
      if ((connectivity == ConnectivityResult.mobile ||
              connectivity == ConnectivityResult.wifi) &&
          !isRemoteDataFetched.value) {
        //Future.delayed is used to make sure that the fetchRemoteUsers always
        // gets called after fetchLocalUsers() if necessary
        Future.delayed(
          1000.milliseconds,
          () => fetchUsers(DataSource.remote),
        );
      }
    });
  }

  fetchUsers(DataSource dataSource) async {
    switch (dataSource) {
      case DataSource.local:
        fetchLocalUsers();
        break;
      case DataSource.remote:
        fetchRemoteUsers();
        break;
    }
  }

  fetchLocalUsers() async {
    //fetching the local data from repository
    final localUsers = await _repository.fetchLocalUsers();

    // Will fetch data for the first time scenario when there is no local data
    if (localUsers.isEmpty) {
      fetchUsers(DataSource.remote);
    }

    //Inserting list of local users in users Rx variable to show on UI
    users.value =
        localUsers.map((localUser) => RemoteUser.fromUser(localUser)).toList();

    //fetching the remote data
    if (!isRemoteDataFetched.value) {
      fetchUsers(DataSource.remote);
    }
  }

  fetchRemoteUsers() async {
    try {
      //changing the flag so it only gets called once;
      isRemoteDataFetched.value = true;
      //fetching data from remote data source (API)
      final res = await _repository.fetchRemoteUsers();
      if (res.statusCode == 200) {
        //converting the response into the ResponseModel Object
        final userResponse = ResponseModel.fromJson(jsonDecode(res.body));
        //Inserting list of remote users in users Rx variable to show on UI
        users.value = userResponse.results;
        //updating data to db
        updateDataToDb(users.value);
      } else {
        //changing the flag so it only gets called once;
        isRemoteDataFetched.value = false;
        //showing snackbar for error
        GeneralUtil.showSnackbar(
          title: 'Error',
          message: 'Error Fetching Remote Users!',
          isError: true,
        );
      }
    } catch (error) {
      log(error.toString());
    }
  }

  deleteLocalData() async => await await _repository.deleteAllUsers();

  Future<void> updateDataToDb(List<RemoteUser>? users) async {
    if (users != null && users.isNotEmpty) {
      //check if the local db already contains the data
      if ((await _repository.fetchLocalUsers()).isNotEmpty) {
        //update local data
        _repository.updateAllUsers(users);
      } else {
        //insert remote data into local db as the local db is empty
        _repository.insertAllUsers(users);
      }
    }
  }
}
