import '../../model/trip.dart';

class StaticKDPartitioning {
  List<Trip> partitionTrips(List<Trip> trips) {
    // Phân tích dữ liệu theo chiều X và Y
    List<Trip> sortedByStartX = List.from(trips)..sort((a, b) => a.startX.compareTo(b.startX));
    List<Trip> sortedByStartY = List.from(trips)..sort((a, b) => a.startY.compareTo(b.startY));

    double medianStartX = _findMedian(sortedByStartX.map((e) => e.startX).toList());
    double medianStartY = _findMedian(sortedByStartY.map((e) => e.startY).toList());

    // Tạo bốn phân vùng từ hai chiều
    List<List<Trip>> partitions = List.generate(4, (_) => []);

    for (var trip in trips) {
      int index = 0;
      index += (trip.startX > medianStartX) ? 2 : 0;
      index += (trip.startY > medianStartY) ? 1 : 0;
      partitions[index].add(trip);
    }

    // Phân chia mỗi phân vùng thêm một lần nữa dựa trên chiều kết thúc
    return partitions.map((partition) {
      List<Trip> sortedByEndX = List.from(partition)..sort((a, b) => a.endX.compareTo(b.endX));
      List<Trip> sortedByEndY = List.from(partition)..sort((a, b) => a.endY.compareTo(b.endY));

      double medianEndX = _findMedian(sortedByEndX.map((e) => e.endX).toList());
      double medianEndY = _findMedian(sortedByEndY.map((e) => e.endY).toList());

      List<List<Trip>> subPartitions = List.generate(4, (_) => []);

      for (var trip in partition) {
        int subIndex = 0;
        subIndex += (trip.endX > medianEndX) ? 2 : 0;
        subIndex += (trip.endY > medianEndY) ? 1 : 0;
        subPartitions[subIndex].add(trip);
      }

      return subPartitions.expand((x) => x).toList();
    }).expand((x) => x).toList();
  }

  double _findMedian(List<double> list) {
    int mid = list.length ~/ 2;
    if (list.length % 2 == 1) {
      return list[mid];
    } else {
      return (list[mid - 1] + list[mid]) / 2.0;
    }
  }
}
