
import 'package:get/get.dart';

import '../../../view_model/airconditioning/airconditioning_screen_view_model.dart';

class AirConditioningBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AirConditioningViewModel());
  }

}