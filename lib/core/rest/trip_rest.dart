import 'dart:convert';

import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/api/services.dart';
import 'package:travel_app_mobile/core/models/response_model/trips/create_trip_model.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/utils/defaultHeaders.dart';

class TripRest {
  // * create trip by user id * //
  Future<CreateTripModelResponse> createTripRest(dynamic data) async {
    CreateTripModelResponse createTripModelResponse = CreateTripModelResponse();

    try {
      String url = "${ApiConstants.baseUrl}${ApiConstants.createTrip}";
      http.Response response = await serviceCall(
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
        url: url,
      );
      if (response.statusCode == 201) {
        createTripModelResponse = CreateTripModelResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        print(response.statusCode);
        print(response.body);
        print("response status code");
      }
    } catch (e) {
      print("error : $e");
    }
    return createTripModelResponse;
  }
}
