import 'package:evaluator_app/view_model/dashboard/documents/document_screen_view_model.dart';
import 'package:get/get.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentViewModel());
  }
}
