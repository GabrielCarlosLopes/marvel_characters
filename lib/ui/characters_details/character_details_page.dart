import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:marvel_characters/presentations/presentations.dart';
import 'package:marvel_characters/ui/characters_details/components/components.dart';

class CharacterDetailsPage extends StatefulWidget {
  final String id;
  const CharacterDetailsPage({super.key, required this.id});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final _store = GetIt.I<CharacterDetailsStore>();

  @override
  void initState() {
    super.initState();
    _store.fetchAll(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    _store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Observer(builder: (context) {
        if (_store.isLoading || _store.characterDetails == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (_store.displayError == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessengerState().showSnackBar(SnackBar(
              content: Text(_store.errorText!),
              behavior: SnackBarBehavior.floating,
            ));
            _store.resetError();
          });
        }

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderDetails(store: _store),
                ComicsCarousel(store: _store),
              ],
            ),
          ),
        );
      }),
    );
  }
}
