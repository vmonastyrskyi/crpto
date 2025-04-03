import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Symbol {
  const Symbol(this.value);

  final String value;
}

extension SymbolX on BuildContext {
  String get symbol => read<Symbol>().value;
}
