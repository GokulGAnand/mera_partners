import 'package:get/get.dart';
import '../../../view_model/document/document_screen_view_model.dart';

class DocumentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentScreenViewModel());
  }
}
