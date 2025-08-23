import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathery/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weathery/model/weather_model.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper instance = ApiHelper._();

  Future<WeatherModel?> fetchApi() async {
    String api =
        "http://api.weatherapi.com/v1/forecast.json?key=${Global.apiId}&q=${Global.city}&days=3";

    http.Response response = await http.get(Uri.parse(api));
    print(".................API CALLED....................");

    WeatherModel? weatherModel;

    if (response.statusCode == 200) {
      print(response.statusCode);
      Map data = jsonDecode(response.body);
      print("data received");
      // return data;
      weatherModel = WeatherModel.fromJson(data as Map<String, dynamic>);
      return weatherModel;
    }
    return null;
  }

  // Future<CurrentWeatherModel?> fetchData() async {
  //   CurrentWeatherModel? currentWeatherModel;
  //   String api =
  //       "https://api.openweathermap.org/data/2.5/weather?lat=${Global.latitude}&lon=${Global.longitude}&appid=${Global.apiId}";

  //   http.Response response = await http.get(Uri.parse(api));
  //   print("API CALLED........................................");

  //   if (response.statusCode == 200) {
  //     print("..............${response.statusCode}....................");
  //     Map data = jsonDecode(response.body);
  //     print("..................DATA IS RECEIVED........................");
  //     currentWeatherModel = CurrentWeatherModel.fromJson(
  //       data as Map<String, dynamic>,
  //     );
  //     return currentWeatherModel;
  //   }
  //   return null;
  // }
}
