import 'package:evaluator_app/view_model/home/account/account_view_model.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => AccountScreenViewModel());
  }

}