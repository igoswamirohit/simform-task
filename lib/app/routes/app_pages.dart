import 'package:get/get.dart';

import '../modules/home/home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const intial = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
