import 'package:flutter/material.dart';

class CharacterNameWidget extends StatelessWidget {
  const CharacterNameWidget({
    super.key,
    required this.characterName,
  });

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        width: 155,
        height: 40,
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  characterName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
