import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:mera_partners/widgets/custom_toast.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';
import '../utils/shared_pref_manager.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  ApiManager._internal();

  static ApiManager get instance => _instance;

  static const String baseUrl = EndPoints.baseUrl;
  static String? _accessToken = globals.token;
  static String? _refreshToken = globals.refreshToken;
  static bool isRefreshed = false;
  static bool isLogout = false;

  static Future<void> _updateTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    globals.token = accessToken;
    globals.refreshToken = refreshToken;
    await SharedPrefManager.instance.setStringAsync(Constants.token, accessToken);
    await SharedPrefManager.instance.setStringAsync(Constants.refreshToken, refreshToken);
  }

  static Future<bool> refreshAccessToken() async {
    isRefreshed = true;
    log('requested new access');
    final response = await http.post(
      Uri.parse('$baseUrl${EndPoints.refreshToken}'),
      headers: {
        'Cookie' : 'refreshToken=${_refreshToken!}',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['meta']['access'];
      await _updateTokens(newAccessToken, globals.refreshToken ?? '');
      return true;
    } else {
      return false;
    }
  }

  static Future<http.Response> _sendRequest(Future<http.Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 401) {
        log('access expired');
        /// Get new access token using refresh token
        if (!isRefreshed && await refreshAccessToken()) {
          return await requestFunction();
        } else {
          /// Both access and refresh tokens expired
          if (!isLogout) {
            isLogout = true;
            CustomToast.instance.showMsg('Session expired. Please log in again.');
          }
          Get.offAllNamed(AppRoutes.loginScreen);
          throw Exception('Session expired. Please log in again.');
        }
      }
      if(response.statusCode == 200){
        log('success');
      }else{
        log('failure');
      }
      return response;
    } catch (error) {
      throw Exception('Failed to send request: $error');
    }
  }

  static Future<http.StreamedResponse> _sendMultiPartRequest(Future<http.StreamedResponse> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      log(response.statusCode.toString());
      log(response.stream.toString());
      if (response.statusCode == 401) {
        if (!isRefreshed && await refreshAccessToken()) {
          return await requestFunction();
        } else {
          CustomToast.instance.showMsg('Session expired. Please log in again.');
          Get.offAllNamed(AppRoutes.loginScreen);
          throw Exception('Session expired. Please log in again.');
        }
      }
      return response;
    } catch (error) {
      throw Exception('Failed to send request: $error');
    }
  }

  static Future<http.Response> get({required String endpoint}) {
    return _sendRequest(() {
      log(baseUrl + endpoint);
      return http.get(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
        },
      );
    });
  }

  static Future<http.Response> post({required String endpoint, required Map<String, dynamic> body}) {
    return _sendRequest(() {
      log(jsonEncode(body).toString());
      var response = http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
        },
        body: jsonEncode(body),
      );
      return response;
    });
  }

  static Future<http.Response> patch({required String endpoint, required Map<String, dynamic> body}) {
    return _sendRequest(() {
      return http.patch(
        Uri.parse(baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_accessToken',
        },
        body: jsonEncode(body),
      );
    });
  }

  static Future<http.StreamedResponse> multipartRequest({
    required String endpoint,
    required Map<String, String> fields,
    required List<Map<String, dynamic>> files,
  }) {
    return _sendMultiPartRequest(() async {
        final uri = Uri.parse('$baseUrl$endpoint');
        final request = http.MultipartRequest('PATCH', uri);

        fields.forEach((key, value) {
          if (value.isNotEmpty) {
            request.fields[key] = value;
          }
        });

        for (var file in files) {
          if (file['path'] != null && !file['path'].toString().startsWith('http')) {
            request.files.add(
              await http.MultipartFile.fromPath(
                file['field'],
                file['path'],
                contentType: MediaType('image', file['path'].split('.').last),
              ),
            );
          }
        }

        request.headers.addAll({
          'Authorization': 'Bearer $_accessToken',
        });

        final streamedResponse = await request.send();
        if (streamedResponse.statusCode == 401) {
        } else {
          final errorResponse = await http.Response.fromStream(streamedResponse);
          throw Exception('Failed to update: ${errorResponse.body}');
        }
        return streamedResponse;
      },
    );
  }

  void updateAuthToken(String accessToken, String refreshToken) {
    _updateTokens(accessToken, refreshToken);
  }
}
