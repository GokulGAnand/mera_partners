import 'package:mera_partners/view_model/splash/splash_screen_view_model.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenViewModel());
  }

}