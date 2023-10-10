import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (_) {
        Future.delayed(const Duration(seconds: 3)).then((_) async {
          context.pushReplacement('/characters');
        });

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 40),
            const CircularProgressIndicator.adaptive(),
          ],
        );
      }),
    );
  }
}
