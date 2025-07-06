import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScrollValue {
  const ScrollValue(this.value);

  final double value;
}

extension ScrollValueX on BuildContext {
  double get scrollValue => read<ScrollValue>().value;
}
