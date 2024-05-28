import 'package:intl/intl.dart';

class DataFormatter {
  static String formatCurrency(int value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
      name: 'IDR',
    );
    return currencyFormatter.format(value);
  }

  static String formatDate(DateTime date) {
    final dateFormatter = DateFormat('dd MMMM yyyy', 'id');
    return dateFormatter.format(date);
  }
}
