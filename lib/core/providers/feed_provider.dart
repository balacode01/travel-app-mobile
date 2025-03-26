import 'package:flutter/material.dart';
import 'package:travel_app_mobile/core/models/response_model/get_all_feeds_model.dart';
import 'package:travel_app_mobile/core/rest/feed_rest.dart';

class FeedProvider extends ChangeNotifier {
  GetFeedModelScreen _feeds = GetFeedModelScreen();
  bool _isLoading = false;

  GetFeedModelScreen get feeds => _feeds;
  bool get isLoading => _isLoading;

  Future<void> getAllFeeds() async {
    _isLoading = true;
    notifyListeners(); // Notify UI about loading state

    try {
      FeedRest feedRest = FeedRest();
      _feeds = await feedRest.fetchFeeds();
    } catch (e) {
      print("Error fetching feeds: $e");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI about updated data
    }
  }
}
