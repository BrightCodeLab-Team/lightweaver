import 'package:intl/intl.dart';

const String staticAssets = "assets/static_assets";
const String dynamicAssets = "assets/dynamic_assets";
const String iconsAssets = "assets/icons_assets";

String formatDate(String? isoDate) {
  if (isoDate == null) return '';
  final date = DateTime.tryParse(isoDate);
  if (date == null) return '';
  return DateFormat('dd/MMM/yyyy').format(date); // Example: 12/Jun/2024
}
