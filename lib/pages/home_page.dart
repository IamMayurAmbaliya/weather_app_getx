import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/constants.dart';
import 'package:weathery/controllers/main_controller.dart';
import 'package:weathery/extensions.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: latitudeController,
                onSaved: (value) {
                  Global.latitude = value ?? Global.latitude;
                },
                decoration: InputDecoration(
                  labelText: "Latitude",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: longitudeController,
                onSaved: (value) {
                  Global.longitude = value ?? Global.longitude;
                },
                decoration: InputDecoration(
                  labelText: "Longitude",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  key.currentState!.save();
                  controller.getWeatherData();
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 50),
              controller.currentWeatherData == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(controller.currentWeatherData!.name),
                              Text(
                                controller.currentWeatherData!.weather[0].main,
                              ),
                              Text(
                                controller
                                    .currentWeatherData!
                                    .weather[0]
                                    .description,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
