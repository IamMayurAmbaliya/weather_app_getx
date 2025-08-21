import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathery/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weathery/model/weather_model.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper instance = ApiHelper._();

  Future<CurrentWeatherModel?> fetchData() async {
    CurrentWeatherModel? currentWeatherModel;
    String api =
        "https://api.openweathermap.org/data/2.5/weather?lat=${Global.latitude}&lon=${Global.longitude}&appid=${Global.apiId}";

    http.Response response = await http.get(Uri.parse(api));
    print("API CALLED........................................");

    if (response.statusCode == 200) {
      print("..............${response.statusCode}....................");
      Map data = jsonDecode(response.body);
      print("..................DATA IS RECEIVED........................");
      currentWeatherModel = CurrentWeatherModel.fromJson(
        data as Map<String, dynamic>,
      );
      return currentWeatherModel;
    }
    return null;
  }
}
