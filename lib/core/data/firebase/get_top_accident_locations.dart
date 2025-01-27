import 'package:user_accident/core/data/firebase/analyze_and_count_accidents_by_location.dart';

Future<List<MapEntry<String, int>>> getTopAccidentLocations() async {
  final locationCounts = await analyzeAccidentData();

  if (locationCounts.isEmpty) {
    return [];
  }

  final filteredLocations = locationCounts.entries
      .where((entry) => entry.value > 2)
      .toList();

  filteredLocations.sort((a, b) => b.value.compareTo(a.value));

  return filteredLocations;
}
