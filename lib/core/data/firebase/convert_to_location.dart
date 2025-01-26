import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getLocationKey(double latitude, double longitude) async {
  final url =
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&accept-language=en'; // للحصول على البيانات باللغة الإنجليزية

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    String? city = data['address']['city']; 
    String? state = data['address']['state']; 
    String? country = data['address']['country']; 

    return "${city ?? 'Unknown'}, ${state ?? 'Unknown'}, ${country ?? 'Egypt'}"; // default to Egypt
  }
  return "Unknown";
}
