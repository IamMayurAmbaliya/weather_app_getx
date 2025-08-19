import 'package:get/get.dart';
import 'package:weathery/pages/favorite_page.dart';
import 'package:weathery/pages/home_page.dart';
import 'package:weathery/pages/save_page.dart';
import 'package:weathery/pages/splash_screen.dart';

class AppRoutes {
  //1.Private Named Constructor
  AppRoutes._();

  //2.Assign into static final object
  static final AppRoutes instance = AppRoutes._();

  // Initial route
  static String initial = "/splash";

  //Pages Name
  static String splash = "/splash";
  static String home = "/home";
  static String save = "/save";
  static String favorite = "/favorite";

  List<GetPage> routes = [
    GetPage(name: AppRoutes.initial, page: () => SplashScreenPage()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.save, page: () => SavePage()),
    GetPage(name: AppRoutes.favorite, page: () => FavoritePage()),
  ];
}
