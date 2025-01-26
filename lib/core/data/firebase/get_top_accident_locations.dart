import 'package:user_accident/core/data/firebase/analyze_and_count_accidents_by_location.dart';

Future<List<MapEntry<String, int>>> getTopAccidentLocations() async {
  final locationCounts = await analyzeAccidentData();

  final sortedLocations = locationCounts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value)); // Descending order

  return sortedLocations;
}
