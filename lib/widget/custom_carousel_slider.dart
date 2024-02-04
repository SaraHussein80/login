import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/news_details_page.dart';

import 'package:login/widget/news_item.dart';

class CustemCarouselSlider extends StatefulWidget {
  const CustemCarouselSlider({super.key});

  @override
  State<CustemCarouselSlider> createState() => _CustemCarouselSliderState();
}

class _CustemCarouselSliderState extends State<CustemCarouselSlider> {
  final _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = news
        .map((item) => InkWell(
              onTap: () {
                final index = news.indexOf(item);
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (_) => NewsDetailsPage(index: index)));
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imgUrl,
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          top: 10.0,
                          left: 20.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight, //
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.category,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  '${item.author} • ${item.time}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                    width: _current == entry.key ? 20 : 10,
                    height: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius: _current == entry.key
                            ? BorderRadius.circular(8)
                            : null,
                        shape: _current == entry.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        color: _current == entry.key
                            ? Theme.of(context).primaryColorLight //
                            : Colors.grey.withOpacity(
                                _current == entry.key ? 0.9 : 0.3))));
          }).toList(),
        ),
      ],
    );
  }
}
