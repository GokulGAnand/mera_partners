import 'package:get/get.dart';
import '../../../../view_model/home/orders/procured_bill_view_model.dart';

class ProcuredCarsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => ProcuredScreenViewModel());
  }
}