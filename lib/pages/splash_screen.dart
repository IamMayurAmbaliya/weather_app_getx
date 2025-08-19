import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/controllers/main_controller.dart';
import 'package:weathery/routes/app_routes.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    controller.startSplashTimer();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, size: 100, color: Colors.black),
            SizedBox(height: 20),
            Text(
              "Weather App",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
