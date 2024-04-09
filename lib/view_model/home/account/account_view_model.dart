import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreenViewModel extends GetxController {
  launchCaller() async {
    Uri url = Uri(scheme: "tel", path: "1234567890");
    if (await canLaunchUrl(url)) {
       await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }   
  }
}