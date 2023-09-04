import 'package:coba_versi_372/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData.dark(),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
