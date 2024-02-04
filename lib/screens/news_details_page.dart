import 'package:flutter/material.dart';
import 'package:login/widget/news_details_app_bar.dart';
import 'package:login/widget/news_details_body.dart';
import 'package:login/widget/news_item.dart';

class NewsDetailsPage extends StatelessWidget {
  final int index;
  const NewsDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                NewsDetailsAppBar(
                  index: index,
                ),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(
                    newsItem: news[index],
                  ),
                ),
                // SliverPadding(padding: EdgeInsets.only(bottom: 700)),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
