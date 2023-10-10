import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCharacterWidget extends StatelessWidget {
  const ImageCharacterWidget({
    super.key,
    required this.characterImage,
  });

  final String characterImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CachedNetworkImage(
        imageUrl: characterImage,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator.adaptive()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(44),
            ),
          );
        },
      ),
    );
  }
}
