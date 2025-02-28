import 'package:intl/intl.dart';

const String emptyString = '';

const String notAssignedString = 'N/A';

extension StringX on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  static String formatCurrency(double price) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      decimalDigits: 2,
      symbol: '',
    );

    String formatted = formatter.format(price);

    formatted = formatted.replaceAll(',', ' ');

    return formatted;
  }
}
