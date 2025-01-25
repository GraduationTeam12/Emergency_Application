import 'dart:math';

class KMeans {
  final int clusters;
  late List<List<double>> centroids;

  KMeans(this.clusters);

  List<int> fit(List<List<double>> data) {
    centroids = List.generate(
      clusters,
      (_) => data[Random().nextInt(data.length)],
    );

    List<int> labels = List.filled(data.length, -1);
    bool changed;

    do {
      changed = false;

      // تحديث المجموعات
      for (int i = 0; i < data.length; i++) {
        int newLabel = _closestCentroid(data[i]);
        if (labels[i] != newLabel) {
          labels[i] = newLabel;
          changed = true;
        }
      }

      // تحديث المراكز
      for (int k = 0; k < clusters; k++) {
        List<List<double>> clusterPoints = [];
        for (int i = 0; i < data.length; i++) {
          if (labels[i] == k) {
            clusterPoints.add(data[i]);
          }
        }

        if (clusterPoints.isNotEmpty) {
          centroids[k] = _average(clusterPoints);
        }
      }
    } while (changed);

    return labels;
  }

  int _closestCentroid(List<double> point) {
    double minDist = double.infinity;
    int label = -1;

    for (int i = 0; i < centroids.length; i++) {
      double dist = _distance(point, centroids[i]);
      if (dist < minDist) {
        minDist = dist;
        label = i;
      }
    }

    return label;
  }

  double _distance(List<double> a, List<double> b) {
    return sqrt(pow(a[0] - b[0], 2) + pow(a[1] - b[1], 2));
  }

  List<double> _average(List<List<double>> points) {
    double sumX = points.map((p) => p[0]).reduce((a, b) => a + b);
    double sumY = points.map((p) => p[1]).reduce((a, b) => a + b);
    return [sumX / points.length, sumY / points.length];
  }
}
