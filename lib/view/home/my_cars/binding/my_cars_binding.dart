import 'package:evaluator_app/view_model/home/my_cars/my_cars_view_model.dart';
import 'package:get/get.dart';

class MyCarsBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => MyCarsScreenViewModel());
  }

}