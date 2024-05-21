import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_gopoolar/core/Algo/map.dart';
import 'package:rc_fl_gopoolar/core/model/static_point_quad_partitioning.dart';
import 'package:rc_fl_gopoolar/model/driver.dart';
import 'package:rc_fl_gopoolar/model/grid_index_cell.dart';
import 'package:rc_fl_gopoolar/model/trip_request.dart';
import 'package:rc_fl_gopoolar/model/user.dart';

import '../model/spatial_partitioner.dart';

class MRB {
  final List<GridIndexCell> GridCell = MapDemo().map;
  List<Driver> findListRideAvailable(TripRequest request){
    List<Driver> listMatchRideAtStart = [];
    List<Driver> listMatchRideAtEnd = [];
    int startIndexGrid = SearchIndexGridSpatial(LatLng(request.startX, request.startY));
    int endIndexGrid = SearchIndexGridSpatial(LatLng(request.endX, request.endY));

    //Kiểm tra xem có chuyến xe nào có thể đón khách tại điểm đón và có thể đón trước thời gian request +10p và kiểm tra ghế trống
    for (var ride in GridCell[startIndexGrid].listRides) {
      if (checkRideCanPick(ride) && checkAvailableSeat(ride)){
          listMatchRideAtStart.add(ride);
      }
    }
    //Kiểm tra xem có chuyến xe nào có thể đón khách tại điểm đón và có thể trả trước thời gian khách mong muốnvà kiểm tra ghế trống
    for (var ride in GridCell[endIndexGrid].listRides) {
      if (checkRideCanPick(ride) && checkAvailableSeat(ride)){
        listMatchRideAtEnd.add(ride);
      }
    }
    List<Driver> listRideSuitable = [];
    listMatchRideAtStart.forEach((ride){
      if (listMatchRideAtEnd.contains(ride)){
        listRideSuitable.add(ride);
      }
    });
    return listRideSuitable;
  }
  Driver FindMinimizedRide(List<Driver> listRides){
    return MinDistancePath(listRides);
  }
  int SearchIndexGridSpatial(LatLng latLng) {
    return 1;
  }
  bool checkRideCanPick(Driver ride){
    return true;
  }
  bool checkAvailableSeat(Driver ride){
    return true;
  }
  Driver MinDistancePath(List<Driver> listRides) {
    return Driver("1", name: "Bao", email: "email", role: Roles.driver);
  }

}


