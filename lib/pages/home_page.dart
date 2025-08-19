import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathery/controllers/main_controller.dart';
import 'package:weathery/extensions.dart';
import 'package:weathery/helpers/api_helper.dart';
import 'package:weathery/model/weather_model.dart';

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
      body: Container(
        padding: EdgeInsets.all(12),
        child: FutureBuilder(
          future: controller.getWeatherData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              CurrentWeatherModel data = snapshot.data;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name.toUpperCase(),
                      style: TextStyle(
                        fontFamily: "poppins_bold",
                        fontSize: 32,
                        letterSpacing: 3,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/weather/${data.weather[0].icon}.png",
                          width: 80,
                          height: 80,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "{${data.main.temp}${"°"}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 64,
                                  fontFamily: "poppins",
                                ),
                              ),
                              TextSpan(
                                text: " ${data.weather[0].main}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  letterSpacing: 3,
                                  fontSize: 14,
                                  fontFamily: "poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.expand_less_rounded,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          label: Text(
                            "${data.main.tempMax}${"°"}",
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.expand_more_rounded,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          label: Text(
                            "${data.main.tempMin}${"°"}",
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(3, (index) {
                        List<String> iconsList = [
                          "assets/icons/clouds.png",
                          "assets/icons/humidity.png",
                          "assets/icons/windspeed.png",
                        ];
                        var values = [
                          "${data.clouds.all}",
                          "${data.main.humidity}",
                          "${data.wind.speed} km/h",
                        ];
                        return Column(
                          children: [
                            Image.asset(iconsList[index], width: 60, height: 60)
                                .box
                                .gray200
                                .padding(const EdgeInsets.all(8))
                                .roundedSM
                                .make(),
                            10.height,
                            Text(
                              "$values[index]",
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ],
                        );
                      }),
                    ),
                    10.height,
                    const Divider(),
                    10.height,
                    FutureBuilder(
                      future: controller.hourlyWeatherData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          HourlyWeatherData hourlyData = snapshot.data;

                          return SizedBox(
                            height: 160,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount:
                                  hourlyData.list!.length > 6
                                      ? 6
                                      : hourlyData.list!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var time = DateFormat.jm().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    hourlyData.list![index].dt!.toInt() * 1000,
                                  ),
                                );

                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      time.text.make(),
                                      Image.asset(
                                        "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                                        width: 80,
                                      ),
                                      10.height,
                                      Text(
                                        "${hourlyData.list![index].main!.temp}${"°"}",
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                    10.height,
                    const Divider(),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Next 7 Days",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text("View All")),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        var day = DateFormat(
                          "EEEE",
                        ).format(DateTime.now().add(Duration(days: index + 1)));
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child:
                                      day.text.semiBold
                                          .color(Theme.of(context).primaryColor)
                                          .make(),
                                ),
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: null,
                                    icon: Image.asset(
                                      "assets/weather/50n.png",
                                      width: 40,
                                    ),
                                    label: Text(
                                      "26${"°"}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "37${"°"} /",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: "poppins",
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 26${"°"}",
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          fontFamily: "poppins",
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
