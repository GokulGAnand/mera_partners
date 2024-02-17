
import 'package:get/get.dart';

import '../../../view_model/pending_evaluation/pending_evaluation_screen_view_model.dart';

class PendingEvaluationBinding extends Bindings {

  @override
  void dependencies(){
    Get.lazyPut(() =>  PendingEvaluationViewModel());
  }

}