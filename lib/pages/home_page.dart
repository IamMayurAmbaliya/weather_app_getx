import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/controllers/main_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    MainController controller = Get.put(MainController());

    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controller.changeTheme();
              },
              icon: Icon(
                controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
