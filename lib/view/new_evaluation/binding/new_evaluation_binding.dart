import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:get/get.dart';

class NewEvaluationBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => NewEvaluationViewModel());
  }

}