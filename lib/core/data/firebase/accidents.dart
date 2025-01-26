import 'package:firebase_database/firebase_database.dart';

Future<List<Map<String, dynamic>>> fetchAccidentData() async {
  final databaseRef = FirebaseDatabase.instance.ref('accidents'); // الإشارة إلى عقدة 'accidents'
  final snapshot = await databaseRef.get(); // جلب البيانات

  if (snapshot.exists) {
    // التعامل مع البيانات كـ List
    final data = snapshot.value as List<dynamic>;
    return data
        .where((item) => item != null) // تجاهل أي قيم null
        .map((item) => Map<String, dynamic>.from(item)) // تحويل كل عنصر إلى Map
        .toList();
  }

  return []; // إذا لم تكن هناك بيانات
}
