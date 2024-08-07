import 'dart:developer';
import 'package:get/get.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/api_manager.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mera_partners/utils/globals.dart' as globals;

class AccountScreenViewModel extends GetxController {
  launchCaller() async {
    Uri url = Uri(scheme: "tel", path: "+91 81130 27722");
    if (await canLaunchUrl(url)) {
       await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

  void deleteAccount() async {
    try {
      var response = await ApiManager.patch(endpoint: EndPoints.users+globals.uniqueUserId!, body: {
        "isDeactivate":true
      });
      
      if(response.statusCode == 200){
        globals.uniqueUserId = null;
        globals.jsonHeaders = {};
        CustomToast.instance.showMsg(MyStrings.success);
        Get.offAllNamed(AppRoutes.loginScreen);
      }else{
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}