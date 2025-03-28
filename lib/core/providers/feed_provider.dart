import 'package:flutter/material.dart';
import 'package:travel_app_mobile/core/models/response_model/feeds/fetch_trip_by_user_id.dart';
import 'package:travel_app_mobile/core/models/response_model/feeds/get_all_feeds_model.dart';
import 'package:travel_app_mobile/core/rest/feed_rest.dart';

class FeedProvider extends ChangeNotifier {
  GetFeedModelScreen _feeds = GetFeedModelScreen();
  FetchTripDetailsByUserIdModel _fetchTripDetailsByUserIdModel =
      FetchTripDetailsByUserIdModel();
  bool _isLoading = false;

  GetFeedModelScreen get feeds => _feeds;
  bool get isLoading => _isLoading;
  FeedRest feedRest = FeedRest();

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// fetch all feeds
  Future<void> getAllFeeds() async {
    _setLoading(true);
    notifyListeners(); // Notify UI about loading state

    try {
      _feeds = await feedRest.fetchFeeds();
    } on Exception catch (e) {
      debugPrint("Error fetching feeds: $e");
    } finally {
      _setLoading(false);
      notifyListeners(); // Notify UI about updated data
    }
  }

  // fetch details of one user by user id
  Future<void> fetchTripDetailsOfUser() async {
    _setLoading(true);
    notifyListeners();

    try {
      _fetchTripDetailsByUserIdModel = await feedRest.fetchTripByUserId();
    } catch (e) {}
  }
}
