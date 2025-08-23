import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';

class MainController extends GetxController {
  //........................ON INIT METHOD...................
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  // MainController() {
  //   getData();
  // }

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
  RxMap data = {}.obs;
  WeatherModel? weatherModel;
  RxBool isFetchingData = false.obs; // Track if data is being fetched
  RxBool isLoading = false.obs;

  Future<void> getData() async {
    weatherModel = await ApiHelper.instance.fetchApi();
    update();
    // try {
    //   isLoading.value = true;
    //   update();
    //   weatherModel = await ApiHelper.instance.fetchApi();
    //   update();
    // } catch (e) {
    //   print(e.toString());
    // } finally {
    //   isLoading.value = false;
    //   update();
    // }

    // isLoading.value = true;
    // update();
    // weatherModel = await ApiHelper.instance.fetchApi();
    // isLoading.value = false;
    // update();
  }

  //initialize in oninit method upper
}
