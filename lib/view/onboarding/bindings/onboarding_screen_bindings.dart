
import 'package:get/get.dart';

import '../../../view_model/onboarding/onboarding_view_model.dart';


class OnboardingBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => OnboardingScreenViewModel());
  }

}