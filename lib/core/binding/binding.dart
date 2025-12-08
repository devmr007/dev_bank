import 'package:dev_bank/features/auth/controller/auth_controller.dart';
import 'package:dev_bank/features/home/controller/home_controller.dart';
import 'package:dev_bank/features/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
