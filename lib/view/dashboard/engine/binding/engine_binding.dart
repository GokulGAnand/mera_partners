import 'package:evaluator_app/view_model/dashboard/engine/engine_screen_view_model.dart';
import 'package:get/get.dart';

class EngineBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EngineViewModel());
  }

}