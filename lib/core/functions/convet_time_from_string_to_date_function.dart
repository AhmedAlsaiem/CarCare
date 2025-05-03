
String parseCustomDateTime(String input) {
  // إزالة الميكروثانية الزائدة إلى 6 خانات كحد أقصى
  final regex = RegExp(r'(\.\d{6})\d*');
  final cleaned = input.replaceFirstMapped(regex, (m) => m.group(1)!);
  DateTime date = DateTime.parse(cleaned);
  return '${date.day}/${date.month}/${date.year}';
}
