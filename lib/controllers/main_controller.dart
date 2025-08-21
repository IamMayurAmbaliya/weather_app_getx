import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    // startSplashTimer();
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
  RxBool isLoading = true.obs;
  Future<void> getWeatherData() async {
    try {
      // isLoading = true.obs;
      currentWeatherData = await ApiHelper.instance.fetchData();
    } catch (e) {
      print(e.toString());
    } finally {
      // isLoading = false.obs;
    }
  }

  //initialize in oninit method upper
}
