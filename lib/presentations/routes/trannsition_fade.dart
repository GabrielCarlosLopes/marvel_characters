import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute transitionFade({required String path, required Widget child}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: ((context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInCubic).animate(animation),
            child: child,
          );
        }),
      );
    },
  );
}
