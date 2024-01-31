import 'package:evaluator_app/view/home/home_screen_ui.dart';
import 'package:evaluator_app/view/login/login_screen_ui.dart';
import 'package:evaluator_app/view/new_evaluation/new_evaluation_screen_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/home/binding/home_screen_binding.dart';
import '../view/login/binding/login_binding.dart';
import '../view/new_evaluation/binding/new_evaluation_binding.dart';

class AppRoutes{

  static const String loginScreen = '/login_screen_ui';
  static const String homeScreen = '/home_screen_ui';
  static const String newEvaluationScreen = '/new_evaluation_screen_ui';

  List<GetPage> pages = [
    GetPage(name: loginScreen,
        page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ]
    ),
    GetPage(name: homeScreen,
        page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ]
    ),
    GetPage(name: newEvaluationScreen,
        page: () => NewEvaluationScreen(),
      bindings: [
        NewEvaluationBinding(),
      ]
    ),
  ];

}