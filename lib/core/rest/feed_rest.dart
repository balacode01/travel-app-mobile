import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/api/services.dart';
import 'package:travel_app_mobile/core/models/response_model/feeds/fetch_trip_by_user_id.dart';
import 'package:travel_app_mobile/core/models/response_model/feeds/get_all_feeds_model.dart';
import 'package:travel_app_mobile/core/utils/defaultHeaders.dart';

class FeedRest {
  // fetch all trips of users //* Feeds *//
  Future<GetFeedModelScreen> fetchFeeds() async {
    GetFeedModelScreen feedsResponse = GetFeedModelScreen();

    try {
      http.Response response = await getServiceCall(
        url: "${ApiConstants.baseUrl}${ApiConstants.feedTrips}",
        headers: await getDefaultHeaders(6),
      );

      if (response.statusCode == 200) {
        feedsResponse = GetFeedModelScreen.fromJson(jsonDecode(response.body));
      } else {
        print("Error fetching feeds: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception in fetchFeeds: $e");
    }

    return feedsResponse;
  }

  // * fetch trip details * //
  Future<FetchTripDetailsByUserIdModel> fetchTripByUserId() async {
    FetchTripDetailsByUserIdModel fetchTripDetailsByUserIdResponse =
        FetchTripDetailsByUserIdModel();
    String urlPath =
        "${ApiConstants.baseUrl}${ApiConstants.getAllTripsByUserId}1";
    print(urlPath);
    print("URL PATH");

    try {
      http.Response response = await getServiceCall(
        url: "${ApiConstants.baseUrl}${ApiConstants.getAllTripsByUserId}1",
      );
      if (response.statusCode == 200) {
        fetchTripDetailsByUserIdResponse =
            FetchTripDetailsByUserIdModel.fromJson(jsonDecode(response.body));
        //print(fetchTripDetailsByUserIdResponse.trips![0].name);
      }
    } catch (e) {
      print("Error : $e");
    }

    return fetchTripDetailsByUserIdResponse;
  }
}
