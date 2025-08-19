import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    startSplashTimer();
    getWeatherData();
    super.onInit();
  }

  //1.SplashScreen...........................................
  void startSplashTimer() async {
    await Future.delayed(Duration(seconds: 5));
    Get.offNamed('/home');
  }
  //initialize in oninit method upper

  //2.ChangeTheme.............................................
  RxBool isDark = false.obs;
  void changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  //3.Api Data.................................
  CurrentWeatherModel? currentWeatherData;
  Future<void> getWeatherData() async {
    currentWeatherData = await ApiHelper.instance.fetchData();
  }
  //initialize in oninit method upper

  RxBool isLoading = false.obs;
}
