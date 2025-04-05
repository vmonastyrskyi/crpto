import 'package:flutter/material.dart';

class FadeSwitcher extends StatelessWidget {
  const FadeSwitcher({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: child,
    );
  }
}
