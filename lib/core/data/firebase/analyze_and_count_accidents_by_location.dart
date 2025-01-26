import 'package:user_accident/core/data/firebase/accidents.dart';
import 'package:user_accident/core/data/firebase/convert_to_location.dart';

Future<Map<String, int>> analyzeAccidentData() async {
  final accidentData = await fetchAccidentData(); // جلب البيانات
  final locationCounts = <String, int>{};

  for (var accident in accidentData) {
    final latitude = accident['lat']; // قراءة خط العرض
    final longitude = accident['long']; // قراءة خط الطول

    // تحويل الإحداثيات إلى اسم المنطقة
    final locationKey = await getLocationKey(latitude, longitude);

    // تحديث العدّاد
    if (locationCounts.containsKey(locationKey)) {
      locationCounts[locationKey] = locationCounts[locationKey]! + 1;
    } else {
      locationCounts[locationKey] = 1;
    }
  }

  return locationCounts; // إرجاع النتائج
}
