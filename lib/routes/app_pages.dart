
import 'package:mera_partners/view/document/binding/document_screen_binding.dart';
import 'package:mera_partners/view/document/document_screen_ui.dart';
import 'package:mera_partners/view/onboarding/bindings/onboarding_screen_bindings.dart';
import 'package:mera_partners/view/onboarding/onboarding_screen_ui.dart';
import 'package:mera_partners/view/splash/splash_screen_ui.dart';
import 'package:mera_partners/view/tutorial/bindings/tutorial_screen_bindings.dart';
import 'package:mera_partners/view/tutorial/tutorial_screen_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/splash/binding/splash_screen_binding.dart';
import 'app_routes.dart';

class AppPages {

  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.documentScreen,
      page: () => DocumentScreen(),
      binding: DocumentScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
  GetPage(
      name: AppRoutes.tutorialScreen,
      page: () => TutorialScreen(),
      binding:TutorialBinding()),
  ];
}
