import 'package:evaluator_app/view_model/home/home_screen_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => HomeScreenViewModel());
  }

}