import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/routes/app_routes.dart';
import 'package:weathery/routes/custom_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.instance.routes,
    );
  }
}
