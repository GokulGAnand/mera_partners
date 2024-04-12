import 'package:mera_partners/view_model/home/orders/orders_view_model.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => OrderScreenViewModel());
  }

}