import 'package:travel_app_mobile/core/utils/local_repo.dart';

Map<String, String> getDefaultHeaders(int headerType) {
  String? sessionId = getSessionId();
  Map<String, String> headers;

  if (headerType == 1) {
    headers = {
      'Authorization': 'Bearer ${getAccessToken()}',
      'Content-Type': 'application/json',
    };
  } else if (headerType == 2) {
    headers = {
      'Authorization': 'Bearer ${getAccessToken()}',
      "Content-Type": "multipart/form-data",
    };
  } else if (headerType == 3) {
    headers = {
      'Authorization': 'Bearer ${getAccessToken()}',
      "Content-Type": "application/x-www-form-urlencoded",
    };
  } else if (headerType == 4) {
    headers = {
      'Authorization': 'Bearer ${getAccessToken()}',
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  } else if (headerType == 5) {
    headers = {
      'Authorization': 'Bearer ${getAccessToken()}',
      "Content-Type": "application/x-www-form-urlencoded",
      "jSessionID": sessionId ?? "",
    };
  } else if (headerType == 6) {
    headers = {
      // 'Authorization': 'Bearer ' + getAccessToken(),
      "Content-Type": "application/json",
    };
  } else {
    headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "jSessionID": sessionId ?? "",
    };
  }

  return headers;
}
