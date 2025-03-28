import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/feed_provider.dart';
import 'package:travel_app_mobile/widgets/feeds/feed_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FeedProvider>(context, listen: false).getAllFeeds();
    });
  }

  Future<void> _refreshFeeds() async {
    await Provider.of<FeedProvider>(context, listen: false).getAllFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(32),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.notifications, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: Consumer<FeedProvider>(
        builder: (context, feedProvider, child) {
          if (feedProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if ((feedProvider.feeds.data ?? []).isEmpty) {
            print(feedProvider.feeds.data);
            return Center(child: Text("No feeds available"));
          }
          return RefreshIndicator(
            onRefresh: _refreshFeeds,
            color: Colors.orange,
            child: ListView.builder(
              itemCount: feedProvider.feeds.data!.length,
              itemBuilder: (context, index) {
                final feed = feedProvider.feeds.data![index];

                return GestureDetector(
                  onTap: () {
                    feedProvider.fetchTripDetailsOfUser();
                  },
                  child: FeedCard(
                    imageUrl: feed.coverImage,
                    title: feed.name,
                    location: feed.location,
                    price: feed.totalBudget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
