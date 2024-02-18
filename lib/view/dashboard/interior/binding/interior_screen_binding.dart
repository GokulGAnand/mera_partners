import 'package:evaluator_app/view_model/dashboard/interior/interior_screen_view_model.dart';
import 'package:get/get.dart';

class InteriorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InteriorViewModel());
  }
}