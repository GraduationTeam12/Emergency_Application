import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<List<Map<String, dynamic>>> fetchAccidentData() async {
  try {
    final databaseRef =  FirebaseDatabase.instanceFor(
  app: Firebase.app(), // التطبيق الحالي
  databaseURL: 'https://smart-accident-system-default-rtdb.firebaseio.com/', // أضف رابط قاعدة البيانات هنا
).ref('accidents'); // الإشارة إلى عقدة 'accidents'
    final snapshot = await databaseRef.get(); // جلب البيانات

    if (snapshot.exists) {
      final data = snapshot.value;
        print('Fetched data: $data');

      if (data is List) {
        // إذا كانت البيانات List
        return data
            .where((item) => item != null) // تجاهل القيم null
            .map((item) => Map<String, dynamic>.from(item)) // تحويل كل عنصر إلى Map
            .toList();
      } else if (data is Map) {
        // إذا كانت البيانات Map
        return data.entries
            .where((entry) => entry.value != null) // تجاهل القيم null
            .map((entry) => Map<String, dynamic>.from(entry.value)) // تحويل القيم إلى Map
            .toList();
      }
    }

    return []; // إذا لم تكن هناك بيانات
  } catch (e) {
    // طباعة الخطأ (أو يمكنك تسجيله في مكان آخر)
    print('Error fetching accident data: $e');
    return [];
  }
}
