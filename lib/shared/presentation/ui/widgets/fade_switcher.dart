import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FadeSwitcher extends StatelessWidget {
  const FadeSwitcher({super.key, this.useSliver = false, required this.child});

  final bool useSliver;
  final Widget child;

  static Widget _defaultSliverTransitionBuilder(
    Widget child,
    Animation<double> animation,
  ) => SliverFadeTransition(opacity: animation, sliver: child);

  static Widget _defaultSliverLayoutBuilder(
    Widget? currentChild,
    List<Widget> previousChildren,
  ) {
    return SliverStack(
      positionedAlignment: Alignment.center,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }

  static Widget _defaultTransitionBuilder(
    Widget child,
    Animation<double> animation,
  ) => FadeTransition(opacity: animation, child: child);

  static Widget _defaultLayoutBuilder(
    Widget? currentChild,
    List<Widget> previousChildren,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      transitionBuilder:
          useSliver
              ? _defaultSliverTransitionBuilder
              : _defaultTransitionBuilder,
      layoutBuilder:
          useSliver ? _defaultSliverLayoutBuilder : _defaultLayoutBuilder,
      child: child,
    );
  }
}
