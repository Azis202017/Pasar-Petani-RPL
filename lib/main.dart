import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pasar_petani/config/theme/default_theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Pasar Petani",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: defaultTheme,
    ),
  );
}
