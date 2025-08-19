import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weathery/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weathery/model/weather_model.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper instance = ApiHelper._();

  Future<WeatherModel?> fetchData(double latitude, double longitude) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?lat=${Global.latitude}&lon=${Global.longitude}&appid=${Global.apiId}";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      WeatherModel weatherModel;
      weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    }
    return null;
  }
}
