import 'package:mera_partners/view_model/car_details/car_details_view_model.dart';
import 'package:get/get.dart';

class CarDetailsBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => CarDetailsScreenViewModel());
  }

}