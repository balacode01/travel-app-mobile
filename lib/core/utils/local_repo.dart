import 'package:get_storage/get_storage.dart';
import 'package:travel_app_mobile/core/utils/get_storage.dart';

String? getAccessToken() {
  final box = GetStorage();
  return box.read(GS_ACCESS_TOKEN);
}

void setAccessToken(String token) {
  final box = GetStorage();
  box.write(GS_ACCESS_TOKEN, token);
}

String? getPhoneNumber() {
  final box = GetStorage();
  return box.read(GS_PHONE_NUMBER);
}

void setPhoneNumber(String number) {
  final box = GetStorage();
  box.write(GS_PHONE_NUMBER, number);
}

String? getSessionId() {
  final box = GetStorage();
  return box.read(GS_SESSION_ID);
}

void setSessionId(String sessionId) {
  final box = GetStorage();
  box.write(GS_SESSION_ID, sessionId);
}
