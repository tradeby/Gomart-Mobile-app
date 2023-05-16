import 'package:intl/intl.dart';

String formatToNairaCurrency(int number) {
  final formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 0,
  );
  return formatter.format(number);
}