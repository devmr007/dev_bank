import 'package:dev_bank/features/auth/presentation/screen/sign_in.dart';
import 'package:dev_bank/features/auth/presentation/screen/sign_up.dart';
import 'package:dev_bank/features/splash/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // splash
  static const String splash = '/splash';
  // auth
  static const String signin = '/sign_in';
  static const String signup = '/sign_up';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.native,
    ),
    GetPage(name: signin, page: () => SignIn(), transition: Transition.native),
    GetPage(name: signup, page: () => SingUp(), transition: Transition.native),
  ];
}
