import 'package:connectivity_plus/connectivity_plus.dart';

class Internet {
  static Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

}