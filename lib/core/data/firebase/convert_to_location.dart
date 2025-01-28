import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getLocationKey(double latitude, double longitude) async {
  final url =
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&accept-language=en'; // للحصول على البيانات باللغة الإنجليزية

  try {
    // تحديد Timeout بـ 10 ثوانٍ
    final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // التحقق من وجود الحقول في الاستجابة
      final address = data['address'] ?? {};
      String? city = address['city'];
      String? state = address['state'];
      String? country = address['country'];

      return "${city ?? 'Unknown City'}, ${state ?? 'Unknown State'}, ${country ?? 'Unknown Country'}";
    } else {
      // في حالة الخطأ من الخادم
      return "Error: Unable to fetch location. HTTP Status ${response.statusCode}";
    }
  } catch (e) {
    // معالجة الأخطاء العامة (مثل انقطاع الإنترنت)
    return "Error: Failed to fetch location. ${e.toString()}";
  }
}
