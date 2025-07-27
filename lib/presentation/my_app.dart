import 'package:day_21_state_management/core/routes/app_pages.dart';
import 'package:day_21_state_management/core/translations/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.jsonAssets});

  final Map<String, Map<String, String>> jsonAssets;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      locale: Locale('en', 'EN'),
      translations: AppTranslation(),
    );
  }
}
