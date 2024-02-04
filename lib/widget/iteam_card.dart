import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/news_details_page.dart';

import 'package:login/widget/custom_carousel_slider.dart';

import 'package:login/widget/news_item.dart';
import 'package:login/widget/recommendation_item.dart';
import 'package:login/widget/title_home.dart';

class IteamCard extends StatefulWidget {
  const IteamCard({super.key});

  @override
  State<IteamCard> createState() => _IteamCardState();
}

class _IteamCardState extends State<IteamCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              const TitleHome(title: "Breaking News"),
              const SizedBox(
                height: 8,
              ),
              const CustemCarouselSlider(),
              const SizedBox(
                height: 16.0,
              ),
              const TitleHome(title: "Recommendation"),
              const SizedBox(
                height: 8.0,
              ),
              ...news
                  .map((newsItem) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: InkWell(
                          onTap: () {
                            final index = news.indexOf(newsItem);
                            Navigator.of(context, rootNavigator: true)
                                .push(
                                  CupertinoPageRoute(
                                    builder: (_) =>
                                        NewsDetailsPage(index: index),
                                  ),
                                )
                                .then((value) => setState(
                                      () {},
                                    ));
                          },
                          child: RecommendationItem(newsItem: newsItem),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
