import 'dart:math';

import '../../model/trip_request.dart';

class SpatialPartitioner {
  void simulatePartitioning(List<TripRequest> requests)  {

    SpatialPartitioner partitioner = SpatialPartitioner();
    List<TripRequest> partitionedData = partitioner.partitionData(requests);
    print('Basic Partitioning: ${partitionedData.map((e) => e.id).toList()}');

    double currentTime = DateTime.now().millisecondsSinceEpoch.toDouble();
    List<TripRequest> adaptivePartitionedData = partitioner.adaptivePartitioning(requests, currentTime);
    print('Adaptive Partitioning: ${adaptivePartitionedData.map((e) => e.id).toList()}');
  }


  List<TripRequest> partitionData(List<TripRequest> requests) {
    //chia dữ liệu thành 4 khu vực dựa trên vị trí X
    List<List<TripRequest>> partitions = List.generate(4, (_) => []);
    for (var request in requests) {
      int partitionIndex = (request.startX / 100).floor() % 4; // Chia các điểm xuất phát theo khoảng cách
      partitions[partitionIndex].add(request);
    }
    return partitions.expand((x) => x).toList();
  }

  List<TripRequest> adaptivePartitioning(List<TripRequest> requests, double currentTime) {

    double adaptiveFactor = sin(currentTime);
    List<List<TripRequest>> partitions = List.generate(4, (_) => []);
    for (var request in requests) {
      int partitionIndex = ((request.startX + adaptiveFactor * 50) / 100).floor() % 4;
      partitions[partitionIndex].add(request);
    }
    return partitions.expand((x) => x).toList();
  }
}
