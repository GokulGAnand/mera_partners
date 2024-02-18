
import 'package:get/get.dart';

import '../../../view_model/special_comments/special_comments_view_model.dart';

class SpecialCommentsBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => SpecialCommentsViewModel());
  }

}