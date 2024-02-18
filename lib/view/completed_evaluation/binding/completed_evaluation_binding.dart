import 'package:get/get.dart';
import '../../../view_model/completed_evaluation/completed_evaluation_view_model.dart';

class CompletedEvaluationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedEvaluationViewModel());
  }

}