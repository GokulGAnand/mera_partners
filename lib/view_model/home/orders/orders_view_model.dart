import 'package:get/get.dart';

class OrderScreenViewModel extends GetxController {
  RxBool isNegotiation = true.obs;
  List<Map<String, dynamic>> negotiationOrdersCategory = [
    {"title": "Negotiation", "isClick": true.obs},
    {"title": "Lost deals", "isClick" : false.obs}
  ];
}