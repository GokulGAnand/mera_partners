import 'package:evaluator_app/view/dashboard/dashboard_screen_ui.dart';
import 'package:evaluator_app/view/dashboard/features/binding/features_screen_binding.dart';
import 'package:evaluator_app/view/home/home_screen_ui.dart';
import 'package:evaluator_app/view/login/login_screen_ui.dart';
import 'package:evaluator_app/view/new_evaluation/new_evaluation_screen_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/dashboard/binding/dashboard_binding.dart';
import '../view/dashboard/documents/binding/document_screen_binding.dart';
import '../view/dashboard/documents/documents_screen_ui.dart';
import '../view/dashboard/exterior/binding/exterior_screen_binding.dart';
import '../view/dashboard/exterior/exterior_screen_ui.dart';
import '../view/dashboard/features/features_screen_ui.dart';
import '../view/home/binding/home_screen_binding.dart';
import '../view/login/binding/login_binding.dart';
import '../view/new_evaluation/binding/new_evaluation_binding.dart';
import '../view/pending_evaluation/binding/pending_evaluation_binding.dart';
import '../view/pending_evaluation/pending_evaluation_screen_ui.dart';
import '../view/testdrive/binding/testdrive_binding.dart';
import '../view/testdrive/testdrive_screen_ui.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen_ui';
  static const String homeScreen = '/home_screen_ui';
  static const String newEvaluationScreen = '/new_evaluation_screen_ui';
  static const String pendingEvaluationScreen = '/pending_evaluation_screen_ui';
  static const String testDriveScreen = '/testdrive_screen_ui';
  static const String documentScreen = '/documents_screen_ui';
  static const String exteriorScreen = '/exterior_screen_ui';
  static const String dashBoardScreen = '/dashboard_screen_ui';
  static const String featuresScreen = '/features_screen_ui';

  List<GetPage> pages = [
    GetPage(name: loginScreen, page: () => LoginScreen(), bindings: [
      LoginBinding(),
    ]),
    GetPage(name: homeScreen, page: () => HomeScreen(), bindings: [
      HomeBinding(),
    ]),
    GetPage(name: newEvaluationScreen, page: () => NewEvaluationScreen(), bindings: [
      NewEvaluationBinding(),
    ]),
    GetPage(name: pendingEvaluationScreen, page: () => PendingEvaluationScreen(), bindings: [
      PendingEvaluationBinding(),
    ]),
    GetPage(name: testDriveScreen, page: () => TestDriveScreen(), bindings: [TestDriveBinding()]),
    GetPage(name: documentScreen, page: () => DocumentScreen(), bindings: [DocumentBinding()]),
    GetPage(name: exteriorScreen, page: () => ExteriorScreen(), bindings: [ExteriorBinding()]),
    GetPage(name: dashBoardScreen, page: () => DashBoardScreen(), bindings: [DashBoardBinding()]),
    GetPage(name: featuresScreen, page: () => FeaturesScreen(), bindings: [FeatureBinding()]),
  ];
}
