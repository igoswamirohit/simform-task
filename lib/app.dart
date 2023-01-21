import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/app_binding.dart';
import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simform Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      initialRoute: AppPages.intial,
    );
  }
}
