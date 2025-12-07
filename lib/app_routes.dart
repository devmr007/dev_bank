import 'package:dev_bank/features/splash/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // splash
  static const String splash = '/splash';
  // auth
  static const String login = '/login';

  static List<GetPage> routes = [
    GetPage(name: splash, page: ()=> SplashScreen(),transition: Transition.native),
    GetPage(name: login, page: ()=> SplashScreen(),transition: Transition.native),
  ];
}
