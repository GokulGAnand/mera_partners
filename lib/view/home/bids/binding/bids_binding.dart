import 'package:mera_partners/view_model/home/bids/bids_view_model.dart';
import 'package:get/get.dart';

class BidsBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => BidsScreenViewModel());
  }

}