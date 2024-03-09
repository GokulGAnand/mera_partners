
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/onboarding/bindings/onboarding_bindings.dart';
import '../view/onboarding/onboarding_screen_ui.dart';

class AppRoutes {

  static const String onboardingScreen =  '/onboarding_Screen_ui';

  List <GetPage> pages =[
    GetPage(name :onboardingScreen, page: ()=> OnboardingScreen(),bindings: [
      OnboardingBinding()
    ])
  ];
}
