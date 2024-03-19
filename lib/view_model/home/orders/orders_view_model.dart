import 'package:evaluator_app/utils/strings.dart';
import 'package:get/get.dart';

class OrderScreenViewModel extends GetxController {
  RxBool isNegotiation = true.obs;
  List<Map<String, dynamic>> negotiationOrdersCategory = [
    {"title": MyStrings.negotiation, "isClick": true.obs},
    {"title": MyStrings.lostDeals, "isClick" : false.obs}
  ];
}