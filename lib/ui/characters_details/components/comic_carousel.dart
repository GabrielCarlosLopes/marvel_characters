import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/presentations/presentations.dart';
import 'package:marvel_characters/ui/characters_details/components/components.dart';

class ComicsCarousel extends StatefulWidget {
  const ComicsCarousel({
    super.key,
    required CharacterDetailsStore store,
  }) : _store = store;

  final CharacterDetailsStore _store;

  @override
  State<ComicsCarousel> createState() => _ComicsCarouselState();
}

class _ComicsCarouselState extends State<ComicsCarousel> {
  int current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final imgList = widget._store.comicsList == null
        ? [Container()]
        : widget._store.comicsList!
            .map(
              (item) => CharacterImageNetwork(thumbnail: item.thumbnail),
            )
            .toList();

    return Column(children: [
      CarouselSlider(
        items: imgList,
        carouselController: _controller,
        options: CarouselOptions(
            aspectRatio: 0.7,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            }),
      ),
      const SizedBox(height: 10),
      Wrap(
        alignment: WrapAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey)
                      .withOpacity(current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
