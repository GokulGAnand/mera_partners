import 'package:get/get.dart';
import '../../../../view_model/dashboard/features/feature_screen_view_model.dart';

class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeatureViewModel());
  }
}
