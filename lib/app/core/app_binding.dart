import 'package:get/get.dart';

import '../data/drift_db/users_table.dart';
import 'app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    //Injecting AppController & MyDatabase for the whole application wide scope
    Get.put<AppController>(AppController(), permanent: true);
    Get.put(MyDatabase());
  }
}
