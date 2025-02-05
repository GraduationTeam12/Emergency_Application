// import 'package:flutter/material.dart';
// import 'package:user_accident/core/data/firebase/get_top_accident_locations.dart';
// import 'package:user_accident/presentation/screens/emegency_screens/places.dart';

// class PlacesScreen extends StatefulWidget {
//   const PlacesScreen({super.key});

//   @override
//   State<PlacesScreen> createState() => _PlacesScreenState();
// }

// class _PlacesScreenState extends State<PlacesScreen> {
//   late Future<List<MapEntry<String, int>>> topLocationsFuture;
//   @override
//   void initState() {
//     topLocationsFuture = getTopAccidentLocations();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<MapEntry<String, int>>>(
//         future: topLocationsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//                 child: CircularProgressIndicator()); // عرض مؤشر تحميل
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text('Error: ${snapshot.error}')); // عرض رسالة خطأ
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//                 child: Text(
//                     'No accident data available')); // عرض رسالة في حال عدم وجود بيانات
//           }

//           // عرض شاشة Places مع البيانات
//           return Places(locations: snapshot.data!);
//         },
//       ),
//     );
    
//   }
// }

import 'package:flutter/material.dart';
import 'package:user_accident/presentation/screens/emegency_screens/places.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Places();
  }
}
