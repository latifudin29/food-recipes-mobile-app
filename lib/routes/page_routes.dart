import 'package:food_recipe/routes/route_name.dart';
import 'package:food_recipe/screens/data_screen.dart';
import 'package:food_recipe/screens/home_screen.dart';
import 'package:food_recipe/screens/login_screen.dart';
import 'package:food_recipe/screens/message_screen.dart';
import 'package:food_recipe/screens/nav_screen.dart';
import 'package:food_recipe/screens/profile_screen.dart';
import 'package:food_recipe/screens/register_screen.dart';
import 'package:food_recipe/screens/welcome_screen.dart';
import 'package:get/get.dart';

class pageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.page1,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: RouteName.page2,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.page3,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RouteName.page4,
      page: () => NavScreen(),
    ),
    GetPage(
      name: RouteName.page5,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteName.page6,
      page: () => DataScreen(),
    ),
    GetPage(
      name: RouteName.page7,
      page: () => MessageScreen(),
    ),
    GetPage(
      name: RouteName.page8,
      page: () => ProfileScreen(),
    ),
  ];
}
