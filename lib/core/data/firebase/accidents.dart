import 'package:firebase_database/firebase_database.dart';

Future<List<Map<String, dynamic>>> fetchAccidents() async {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('accidents');
  final DatabaseEvent event = await databaseRef.once();
  final data = event.snapshot.value as Map?;

  if (data != null) {
    return data.entries.map((entry) {
      final accident = entry.value as Map;
      return {
        'id': entry.key,
        'lat': accident['lat'],
        'long': accident['long'],
      };
    }).toList();
  } else {
    return [];
  }
}
