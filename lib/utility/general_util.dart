import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class GeneralUtil {
  static showSnackbar(
      {required String title, required String message, required bool isError}) {
    Get.snackbar(title, message,
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        backgroundColor: Colors.red);
  }

  static showLoader() {
    Get.dialog(const SpinKitWave(color: Colors.blue),
        barrierDismissible: false);
  }

  static hideLoader() {
    Get.back();
  }

  // static clearDataAndLogout() {
  //   Future.wait([
  //     HiveBox.deleteBusinessInfo(),
  //     HiveBox.deleteBusinessTypesAndCategory(),
  //     HiveBox.deleteCountriesAndStates(),
  //     HiveBox.deleteUserInfo(),
  //     SecureStorage.deleteToken()
  //   ]).then((value) => Get.offAllNamed(Routes.LOGIN));
  // }
}
