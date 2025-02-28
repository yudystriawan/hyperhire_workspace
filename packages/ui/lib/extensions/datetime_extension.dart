import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formatted([String? format]) {
    return DateFormat(format ?? 'dd-MM-yyyy HH:mm').format(this);
  }
}
