import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    startSplashTimer();
  }

  void startSplashTimer() async {
    await Future.delayed(Duration(seconds: 5));
    Get.offNamed('/home');
  }

  void changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
