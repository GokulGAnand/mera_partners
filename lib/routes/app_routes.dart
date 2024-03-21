
import 'package:evaluator_app/view/car_details/binding/car_details_binding.dart';
import 'package:evaluator_app/view/car_details/car_details_screen_ui.dart';
import 'package:evaluator_app/view/gallery/binding/gallery_binding.dart';
import 'package:evaluator_app/view/gallery/gallery_screen.dart';
import 'package:evaluator_app/view/gallery/image_view_screen.dart';
import 'package:evaluator_app/view/document/binding/document_screen_binding.dart';
import 'package:evaluator_app/view/document/document_screen_ui.dart';
import 'package:evaluator_app/view/home/account/about_us/about_us_screen.dart';
import 'package:evaluator_app/view/home/account/account_screen_ui.dart';
import 'package:evaluator_app/view/home/account/binding/account_binding.dart';
import 'package:evaluator_app/view/home/account/privacy_policy/privacy_policy_screen.dart';
import 'package:evaluator_app/view/home/bids/bids_screen.dart';
import 'package:evaluator_app/view/home/bids/binding/bids_binding.dart';
import 'package:evaluator_app/view/home/binding/home_binding.dart';
import 'package:evaluator_app/view/home/home_screen_ui.dart';
import 'package:evaluator_app/view/home/my_cars/binding/my_cars_binding.dart';
import 'package:evaluator_app/view/home/my_cars/my_cars_screen.dart';
import 'package:evaluator_app/view/home/orders/binding/orders_binding.dart';
import 'package:evaluator_app/view/home/orders/orders_screen.dart';
import 'package:evaluator_app/view/login/binding/login_binding.dart';
import 'package:evaluator_app/view/login/login_screen_ui.dart';
import 'package:evaluator_app/view/login/otp_screen_ui.dart';
import 'package:evaluator_app/view/onboarding/bindings/onboarding_screen_bindings.dart';
import 'package:evaluator_app/view/onboarding/onboarding_screen_ui.dart';
import 'package:evaluator_app/view/procured_bill/procured_bill_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splashScreen = '/splash_screen';
  static const documentScreen = '/document_screen_ui';
  static const onboardingScreen ='/onboarding_screen_ui';
  static const tutorialScreen = '/tutorial_screen_ui';
  static const String loginScreen = '/login_screen_ui';
  static const String otpScreen = '/otp_screen_ui';
  static const String homeScreen = '/home_screen_ui';

  static const String bidsScreen = '/bids_screen_ui';
  static const String myCarsScreen = '/my_cars_screen_ui';
  static const String ordersScreen = '/orders_screen_ui';
  static const String accountScreen = '/account_screen_ui';

  static const String carDetailsScreen = '/car_details_screen_ui';
  static const String galleryScreen = '/gallery_screen_ui';
  static const String imageViewScreen = '/image_view_screen_ui';
  static const String procuredBill = '/procured_bill_screen_ui';
  static const String aboutUsScreen = '/about_us_screen_ui';
  static const String privacyPolicyScreen = '/privacy_policy_screen_ui';

  List<GetPage> pages = [
    GetPage(name: onboardingScreen, page: () => OnboardingScreen(),
      bindings: [
      OnboardingBinding(),
    ]),
    GetPage(name: documentScreen, page: () => DocumentScreen(),
      bindings: [
      DocumentScreenBinding(),
    ]),
    GetPage(name: loginScreen, page: () => const LoginScreen(),
      bindings: [
      LoginBinding(),
    ]),
    GetPage(name: otpScreen, page: () => const OtpScreen(),
      bindings: [
      LoginBinding(),
    ]),
    GetPage(name: homeScreen, page: () => const HomeScreen(),
      bindings: [
      HomeBinding(),
    ]), 
    GetPage(name: bidsScreen, page: () => const BidsScreen(),
      bindings: [
      BidsBinding(),
    ]),
    GetPage(name: myCarsScreen, page: () => const MyCarsScreen(),
      bindings: [
      MyCarsBinding(),
    ]),
    GetPage(name: ordersScreen, page: () => const OrdersScreen(),
      bindings: [
      OrdersBinding(),
    ]),
    GetPage(name: procuredBill, page: () => const ProcuredBillScreen(),
      bindings: [
      OrdersBinding(),
    ]),
    GetPage(name: accountScreen, page: () => const AccountScreen(),
      bindings: [
      AccountBinding(),
    ]),
    GetPage(name: carDetailsScreen, page: () => const CarDetailsScreen(),
      bindings: [
      CarDetailsBinding(),
    ]),
    GetPage(name: galleryScreen, page: () => const GalleryScreen(),
      bindings: [
      GalleryBinding(),
    ]),
    GetPage(name: imageViewScreen, page: () => const ImageViewScreen(),
      bindings: [
      GalleryBinding(),
    ]),
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen(),
      bindings: [
      AccountBinding(),
    ]),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen(),
      bindings: [
      AccountBinding(),
    ]),
  ];
}
