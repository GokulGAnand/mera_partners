import 'package:mera_partners/view_model/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => LoginScreenViewModel());
  }

}