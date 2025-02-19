const String emptyString = '';

const String notAssignedString = 'N/A';

extension StringHelper on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
