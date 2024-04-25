import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/globals.dart' as globals;

class AccountScreenViewModel extends GetxController {
  launchCaller() async {
    Uri url = Uri(scheme: "tel", path: "1234567890");
    if (await canLaunchUrl(url)) {
       await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

  void deleteAccount() async {
    try {
      log(Uri.parse(EndPoints.baseUrl+EndPoints.users+globals.uniqueUserId!).toString());
      var response = await http.patch(Uri.parse(EndPoints.baseUrl+EndPoints.users+globals.uniqueUserId!),headers: globals.jsonHeaders,
        body: jsonEncode({
          "isDeactivate":true
        })
      );
      log(response.body);
      if(response.statusCode == 200){
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