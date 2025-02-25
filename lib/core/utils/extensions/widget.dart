import 'package:flutter/widgets.dart';

extension WidgetExtenstion on Widget {
  Widget withSliverPadding(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return SliverPadding(
      padding: EdgeInsetsDirectional.fromSTEB(left, top, right, bottom),
      sliver: this,
    );
  }

  Widget withSliverPaddingAll(double value) {
    return SliverPadding(padding: EdgeInsets.all(value), sliver: this);
  }

  Widget withSliverPaddingSymmetric(double horizontal, double vertical) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      sliver: this,
    );
  }

  Widget withSliverPaddingOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return SliverPadding(
      padding: EdgeInsetsDirectional.fromSTEB(
        left ?? 0.0,
        top ?? 0.0,
        right ?? 0.0,
        bottom ?? 0.0,
      ),
      sliver: this,
    );
  }

  Widget withPadding(
    double left,
    double top,
    double right,
    double bottom, {
    bool animate = false,
  }) {
    return animate
        ? AnimatedPadding(
          padding: EdgeInsetsDirectional.fromSTEB(left, top, right, bottom),
          duration: const Duration(milliseconds: 125),
          curve: Curves.fastOutSlowIn,
          child: this,
        )
        : Padding(
          padding: EdgeInsetsDirectional.fromSTEB(left, top, right, bottom),
          child: this,
        );
  }

  Widget withPaddingAll(double value, {bool animate = false}) {
    return animate
        ? AnimatedPadding(
          padding: EdgeInsets.all(value),
          duration: const Duration(milliseconds: 125),
          curve: Curves.fastOutSlowIn,
          child: this,
        )
        : Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget withPaddingSymmetric(
    double horizontal,
    double vertical, {
    bool animate = false,
  }) {
    return animate
        ? AnimatedPadding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          duration: const Duration(milliseconds: 125),
          curve: Curves.fastOutSlowIn,
          child: this,
        )
        : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: this,
        );
  }

  Widget withPaddingOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
    bool animate = false,
  }) {
    return animate
        ? AnimatedPadding(
          padding: EdgeInsetsDirectional.fromSTEB(
            left ?? 0.0,
            top ?? 0.0,
            right ?? 0.0,
            bottom ?? 0.0,
          ),
          duration: const Duration(milliseconds: 125),
          curve: Curves.fastOutSlowIn,
          child: this,
        )
        : Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            left ?? 0.0,
            top ?? 0.0,
            right ?? 0.0,
            bottom ?? 0.0,
          ),
          child: this,
        );
  }

  Widget get flexible => Flexible(child: this);

  Widget get expanded => Expanded(child: this);
}
