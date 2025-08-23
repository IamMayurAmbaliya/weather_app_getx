import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/constants.dart';
import 'package:weathery/controllers/main_controller.dart';
import 'package:weathery/extensions.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';
import 'package:intl/intl.dart';
import 'package:weathery/pages/home_page/components/currentWeatherMoreDetail.dart';
import 'package:weathery/pages/home_page/components/tempratureAreaWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    String date = DateFormat("yMMMMd").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text("WEATHERY", style: TextStyle(color: Colors.pink)),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controller.changeTheme();
              },
              icon: Icon(
                controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body:
          controller.weatherModel == null
              ? Center(child: const CircularProgressIndicator())
              : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    // SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.weatherModel!.location.name,
                            style: const TextStyle(fontSize: 35, height: 2),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            // bottom: 20,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            date,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.weatherModel!.current.lastUpdated
                                .toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            //Temprature Area
                            tempretureAreaWidget(),
                            SizedBox(height: 20),
                            //More Details--windspeed humidity cloud
                            currentWeatherMoreDetailWidget(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

      //     controller.weatherModel == null
      // ? Center(child: CircularProgressIndicator())
      // : GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 1,
      //     crossAxisSpacing: 1,
      //     childAspectRatio: 4,
      //   ),
      //   itemCount:
      //       controller
      //           .weatherModel!
      //           .forecast
      //           .forecastday[2]
      //           .hour
      //           .length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       color: Colors.red,
      //       child: Center(
      //         child: Text(
      //           controller
      //               .weatherModel!
      //               .forecast
      //               .forecastday[2]
      //               .hour[index]
      //               .time
      //               .toString()
      //               .toUpperCase(),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
