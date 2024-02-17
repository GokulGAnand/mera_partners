import 'package:get/get.dart';
import '../../../../view_model/dashboard/exterior/exterior_screen_view_model.dart';

class ExteriorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExteriorViewModel());
  }
}
