import 'package:travel_app_mobile/core/utils/token_storage.dart';

Future<Map<String, String>> getDefaultHeaders(int headerType) async {
  String? token = await TokenStorage.getToken(); //  Await the token retrieval
  Map<String, String> headers;

  if (headerType == 1) {
    headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  } else if (headerType == 2) {
    headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "multipart/form-data",
    };
  } else if (headerType == 3) {
    headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/x-www-form-urlencoded",
    };
  } else if (headerType == 4) {
    headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  } else if (headerType == 5) {
    headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/x-www-form-urlencoded",
      // "JSessionID": sessionId ?? "",
    };
  } else if (headerType == 6) {
    headers = {
      'Authorization': 'Bearer $token', // Fixed by awaiting token
      "Content-Type": "application/json",
    };
  } else {
    headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      // "JSessionID": sessionId ?? "",
    };
  }

  return headers;
}
