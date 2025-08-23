import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/controllers/main_controller.dart';

Widget tempretureAreaWidget() {
  MainController controller = Get.find<MainController>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.network(
        controller.weatherModel!.current.condition.icon,
        height: 80,
        width: 80,
      ),
      Container(height: 50, width: 1, color: Colors.black),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${controller.weatherModel!.current.tempC.toInt()}°",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: controller.weatherModel!.current.condition.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
