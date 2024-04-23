import 'package:get/get.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';

class NegotiationCarsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => NegotiationViewModel());
  }
}