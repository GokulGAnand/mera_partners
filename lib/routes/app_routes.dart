
import 'package:evaluator_app/view/login/binding/login_binding.dart';
import 'package:evaluator_app/view/login/login_screen_ui.dart';
import 'package:evaluator_app/view/login/otp_screen_ui.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';
  static const documentScreen = '/document_screen_ui';
  static const onboardingScreen ='/onboarding_screen_ui';
  static const String loginScreen = '/login_screen_ui';
  static const String otpScreen = '/otp_screen_ui';

  List<GetPage> pages = [
    GetPage(name: loginScreen, page: () => const LoginScreen(),
      bindings: [
      LoginBinding(),
    ]),
    GetPage(name: otpScreen, page: () => const OtpScreen(),
      bindings: [
      LoginBinding(),
    ]), 
  ];
}
