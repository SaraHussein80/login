import 'package:flutter/material.dart';
import 'package:login/widget/app_bar_icon.dart';
import 'package:login/widget/news_item.dart';

class NewsDetailsAppBar extends StatefulWidget {
  final int index;
  const NewsDetailsAppBar({super.key, required this.index});

  @override
  State<NewsDetailsAppBar> createState() => _NewsDetailsAppBarState();
}

class _NewsDetailsAppBarState extends State<NewsDetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AppBarIcon(
          icon: Icons.chevron_left,
          iconSize: 30,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      leadingWidth: 40,
      actions: [
        AppBarIcon(
          icon: news[widget.index].isFavorite
              ? Icons.bookmark
              : Icons.bookmark_border_outlined,
          onTap: () {
            setState(() {
              news[widget.index] = news[widget.index]
                  .copyWith(isFavorite: !news[widget.index].isFavorite);
            });
          },
        ),
        const SizedBox(
          width: 6.0,
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                news[widget.index].imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Opacity(
                opacity: 0.15,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight, //
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news[widget.index].category,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      news[widget.index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '${news[widget.index].author} • ${news[widget.index].time}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      pinned: true,
      collapsedHeight: size.height * 0.1,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
