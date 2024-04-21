import 'package:get/get.dart';
import '../../../../view_model/home/orders/procured_cars_view_model.dart';

class ProcuredCarsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => ProcuredViewModel());
  }
}