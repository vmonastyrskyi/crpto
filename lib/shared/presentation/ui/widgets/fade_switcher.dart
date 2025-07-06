import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FadeSwitcher extends StatelessWidget {
  const FadeSwitcher({
    super.key,
    this.duration = const Duration(milliseconds: 375),
    this.reverseDuration = const Duration(milliseconds: 375),
    this.switchInCurve = Curves.fastOutSlowIn,
    this.switchOutCurve = Curves.fastOutSlowIn,
    this.sliverTransitionBuilder = _defaultSliverTransitionBuilder,
    this.sliverLayoutBuilder = _defaultSliverLayoutBuilder,
    this.transitionBuilder = _defaultTransitionBuilder,
    this.layoutBuilder = _defaultLayoutBuilder,
    this.useSliver = false,
    required this.child,
  });

  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final AnimatedSwitcherTransitionBuilder sliverTransitionBuilder;
  final AnimatedSwitcherLayoutBuilder sliverLayoutBuilder;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
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
      duration: duration,
      reverseDuration: reverseDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: useSliver ? sliverTransitionBuilder : transitionBuilder,
      layoutBuilder: useSliver ? sliverLayoutBuilder : layoutBuilder,
      child: child,
    );
  }
}
