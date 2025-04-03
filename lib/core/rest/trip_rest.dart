import 'dart:convert';

import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/api/services.dart';
import 'package:travel_app_mobile/core/models/response_model/trips/create_trip_model.dart';
import 'package:http/http.dart' as http;

class TripRest {
  // * create trip by user id * //
  Future<CreateTripModelResponse> createTripRest(dynamic data) async {
    CreateTripModelResponse createTripModelResponse = CreateTripModelResponse();

    try {
      String url = "${ApiConstants.baseUrl}${ApiConstants.createTrip}";
      http.Response response = await serviceCall(body: data, url: url);
      if (response.statusCode == 201) {
        createTripModelResponse = CreateTripModelResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        print(response.statusCode);
        print("response status code");
      }
    } catch (e) {}
    return createTripModelResponse;
  }
}
