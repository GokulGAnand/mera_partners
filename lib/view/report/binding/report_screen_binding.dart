import 'package:evaluator_app/view_model/report/report_screen_view_model.dart';
import 'package:get/get.dart';

class ReportScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportScreenViewModel());
  }
}