import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterImageNetwork extends StatelessWidget {
  final String thumbnail;
  const CharacterImageNetwork({
    super.key,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: thumbnail,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator.adaptive()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
