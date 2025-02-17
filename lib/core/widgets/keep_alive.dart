import 'package:flutter/material.dart';

class KeepAliveChild extends StatefulWidget {
  const KeepAliveChild({super.key, required this.child});

  final Widget child;

  @override
  State<KeepAliveChild> createState() => _KeepAliveChildState();
}

class _KeepAliveChildState extends State<KeepAliveChild>
    with AutomaticKeepAliveClientMixin<KeepAliveChild> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
