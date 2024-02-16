import 'package:evaluator_app/view_model/dashboard/dashboard_view_model.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardViewModel());
  }
}
