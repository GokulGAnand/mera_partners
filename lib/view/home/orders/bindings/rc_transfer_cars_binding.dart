import 'package:get/get.dart';
import 'package:mera_partners/view_model/home/orders/rc_transfer_view_model.dart';

class RcTransferCarsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => RcTransferViewModel());
  }
}