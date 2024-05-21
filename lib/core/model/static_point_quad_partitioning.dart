import '../../model/trip.dart';

class StaticPointQuadPartitioning {
  List<List<Trip>> partitionTrips(List<Trip> trips) {
    // Tìm giá trị trung vị cho mỗi chiều
    List<double> startXs = trips.map((e) => e.startX).toList();
    List<double> startYs = trips.map((e) => e.startY).toList();
    List<double> endXs = trips.map((e) => e.endX).toList();
    List<double> endYs = trips.map((e) => e.endY).toList();
    double medianStartX = _findMedian(startXs);
    double medianStartY = _findMedian(startYs);
    double medianEndX = _findMedian(endXs);
    double medianEndY = _findMedian(endYs);

    List<List<Trip>> partitions = List.generate(16, (_) => []);

    for (var trip in trips) {
      int index = 0;
      index += (trip.startX > medianStartX) ? 8 : 0;
      index += (trip.startY > medianStartY) ? 4 : 0;
      index += (trip.endX > medianEndX) ? 2 : 0;
      index += (trip.endY > medianEndY) ? 1 : 0;
      partitions[index].add(trip);
    }

    return partitions;
  }

  double _findMedian(List<double> list) {
    list.sort();
    int mid = list.length ~/ 2;
    if (list.length % 2 == 1) {
      return list[mid];
    } else {
      return (list[mid - 1] + list[mid]) / 2.0;
    }
  }
}
