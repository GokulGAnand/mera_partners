import 'package:get/get.dart';

import '../../../view_model/tutorial/tutorial_view_model.dart';

class TutorialBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => TutorialScreenViewModel());
  }
}