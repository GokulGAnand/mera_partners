
import 'package:get/get.dart';

import '../../../view_model/testdrive/testdrive_screen_view_model.dart';

class TestDriveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestDriveViewModel());
  }

}