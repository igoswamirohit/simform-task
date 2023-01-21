import 'package:get/get.dart';

import '../../../data/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository()));
  }
}