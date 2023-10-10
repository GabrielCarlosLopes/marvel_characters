import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';
import 'package:marvel_characters/ui/characters_details/components/components.dart';

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    super.key,
    required CharacterDetailsStore store,
  }) : _store = store;

  final CharacterDetailsStore _store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: _store.characterDetails!.image,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 270,
              child: HeaderNameDescription(store: _store),
            ),
            Positioned(
              top: 0,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
