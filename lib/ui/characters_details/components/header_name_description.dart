import 'package:flutter/material.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';

class HeaderNameDescription extends StatelessWidget {
  const HeaderNameDescription({
    super.key,
    required CharacterDetailsStore store,
  }) : _store = store;

  final CharacterDetailsStore _store;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
          child: Container(
            alignment: Alignment.center,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                _store.characterDetails!.description.isEmpty
                    ? 'No description available'
                    : _store.characterDetails!.description,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 60,
              width: 360,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _store.characterDetails!.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
