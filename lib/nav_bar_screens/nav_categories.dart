import 'package:flutter/material.dart';
import 'package:login/widget/news_item.dart';
import 'package:login/widget/recommendation_item.dart';

class CategoreScreen extends StatelessWidget {
  const CategoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritedItems = news.where((item) => item.isFavorite == true);

    if (favoritedItems.isEmpty) {
      return Center(
        child: Text(
          "No Bookmarks Available!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: favoritedItems
            .map(
              (favoritedItem) => RecommendationItem(newsItem: favoritedItem),
            )
            .toList(),
      ),
    );
  }
}
