import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  AppController();
  final connectivity = Rx<ConnectivityResult?>(null);

  @override
  void onReady() {
    super.onReady();
    //Listeneing the connectivity changes & storing the changes into a Rx Variable
    Connectivity().onConnectivityChanged.listen((event) {
      connectivity.value = event;
    });
  }
}
