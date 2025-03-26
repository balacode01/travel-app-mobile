import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/api/services.dart';
import 'package:travel_app_mobile/core/models/response_model/get_all_feeds_model.dart';
import 'package:travel_app_mobile/core/utils/token_storage.dart';
import 'package:travel_app_mobile/core/utils/utils.dart';

class FeedRest {
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
}
