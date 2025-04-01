import 'package:intl/intl.dart';

const String emptyString = '';

const String notAssignedString = 'N/A';

extension StringX on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  static String formatCurrency(
    double price, {
    int minimumFractionDigits = 2,
    int maximumFractionDigits = 6,
  }) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '');

    formatter.minimumFractionDigits = minimumFractionDigits;
    formatter.maximumFractionDigits = maximumFractionDigits;

    String formatted = formatter.format(price);

    return formatted;
  }
}
