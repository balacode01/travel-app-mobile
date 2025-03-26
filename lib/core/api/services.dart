import 'package:http/http.dart' as http;

Future<dynamic> serviceCall({headers, url, body}) async {
  http.Response response;
  response = await http.post(Uri.parse(url), headers: headers, body: body);
  return response;
}

Future<dynamic> getServiceCall({
  required String url,
  Map<String, String>? headers,
}) async {
  http.Response response;
  response = await http.get(Uri.parse(url), headers: headers);
  return response;
}
