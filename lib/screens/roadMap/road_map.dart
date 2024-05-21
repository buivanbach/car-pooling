import 'dart:async';
import 'dart:ui' as ui;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  GoogleMapController? mapController;

  static const CameraPosition currentPosition = CameraPosition(
    target: LatLng(22.535524, 88.365300),
    zoom: 12.00,
  );

  List<Marker> allMarkers = [];
  Map<PolylineId, Polyline> polylines = {};

  final points = [
    const LatLng(22.548208, 88.334758),
    const LatLng(22.549476, 88.384917),
    const LatLng(22.573889, 88.408965),
    const LatLng(22.626187, 88.406218),
  ];

  final passengerList = [
    {"image": "assets/startRide/image-1.png", "name": "Tạ Thắng"},
    {"image": "assets/startRide/image-2.png", "name": "Hà Phương"},
    {"image": "assets/startRide/image-3.png", "name": "Quang Ngô"},
    {"image": "assets/startRide/image-4.png", "name": "Trần Thịnh"},
  ];

  final markerPointList = [
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(21.070991812324493, 105.7853710166412),
      "info": "Ride start"
    },
    {
      "image": "assets/endRide/grey-marker.png",
      "latLang": const LatLng(21.029569046736334, 105.7795601989241),
    },
    {
      "image": "assets/endRide/grey-marker.png",
      "latLang": const LatLng(21.027877068067973, 105.78735600916951),
    },
    {
      "image": "assets/endRide/grey-marker.png",
      "latLang": const LatLng(21.01436029896516, 105.79543078824493),
    },
    {
      "image": "assets/mapView/destinationicon.png",
      "latLang": const LatLng(21.00944846381003, 105.78891903388327),
    },
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(20.973616836838154, 105.81689589574434),
    },
    {
      "image": "assets/endRide/red-marker.png",
      "latLang": const LatLng(20.966230290557522, 105.83580784390732),
    },
    {
      "image": "assets/endRide/red-marker.png",
      "latLang": const LatLng(20.964449513706224, 105.87311491516452),
    },
    {
      "image": "assets/endRide/red-marker.png",
      "latLang": const LatLng(21.011623730817, 105.91750743457096),
    },
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(20.89528567626856, 105.99307880983307),
      "info": "Ride end"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
        title: const Text(
          "Roadmap",
          style: semibold18White,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            googlmap(),
            bottomSheet(),
            endRideButton(),
          ],
        ),
      ),
    );
  }

  bottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          curve: Curves.easeIn,
          delay: const Duration(milliseconds: 350),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                      child: Text(
                        "Ride start on 25 june 2023",
                        style: semibold16Black33,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: List.generate(
                          passengerList.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: fixPadding * 2.0),
                            constraints: const BoxConstraints(maxWidth: 60.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        passengerList[index]['image']
                                            .toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                height5Space,
                                Text(
                                  passengerList[index]['name'].toString(),
                                  style: medium12Grey,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    step("Ride start",
                        "2715 Ash Dr. San Jose, South Dakota 83475", greyColor,
                        isPickDropPoint: false),
                    step("Pick up cameron willimson",
                        "2715 Ash Dr. San Jose, South Dakota 83475", greyColor),
                    step("Pick up brooklyn simmons",
                        "2715 Ash Dr. San Jose, South Dakota 83475", greyColor),
                    step("Pick up leslie alexander ",
                        "2715 Ash Dr. San Jose, South Dakota 83475", greyColor),
                    step(
                        "Pick up jacob jones",
                        "2715 Ash Dr. San Jose, South Dakota 83475",
                        greenColor),
                    step("Drive", "2715 Ash Dr. San Jose, South Dakota 83475",
                        primaryColor,
                        isPickDropPoint: false),
                    step("Drop up brooklyn simmons",
                        "2715 Ash Dr. San Jose, South Dakota 83475", redColor),
                    step("Drop up leslie alexander ",
                        "2715 Ash Dr. San Jose, South Dakota 83475", redColor),
                    step("Drop up jacob jones",
                        "2715 Ash Dr. San Jose, South Dakota 83475", redColor),
                    step(
                        "Ride end",
                        "2715 Ash Dr. San Jose, South Dakota 83475",
                        primaryColor,
                        isPickDropPoint: false,
                        isDivider: false),
                    heightBox(fixPadding * 9.0)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  endRideButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: whiteColor,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/endRide');
          },
          child: Container(
            height: 50.0,
            width: double.maxFinite,
            margin: const EdgeInsets.all(fixPadding * 2.0),
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: secondaryColor.withOpacity(0.1),
                  blurRadius: 12.0,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              "End ride",
              style: semibold18White,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  step(String title, String subTitle, Color iconColor,
      {isDivider = true, isPickDropPoint = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              isPickDropPoint
                  ? Container(
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: iconColor),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.location_pin,
                        color: iconColor,
                        size: 12.0,
                      ),
                    )
                  : Image.asset(
                      "assets/mapView/ride start.png",
                      height: 16.0,
                      width: 16.0,
                      color: iconColor,
                    ),
              isDivider
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 0.8),
                      child: DottedBorder(
                        padding: EdgeInsets.zero,
                        dashPattern: const [2.2, 4],
                        color: greyD4Color,
                        strokeWidth: 1.2,
                        child: Container(
                          height: 45.0,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          widthSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: medium14Grey,
                overflow: TextOverflow.ellipsis,
              ),
              height5Space,
              Text(
                subTitle,
                style: medium14Black3C,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ],
      ),
    );
  }

  googlmap() {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.terrain,
      initialCameraPosition: currentPosition,
      onMapCreated: mapCreated,
      markers: Set.from(allMarkers),
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  mapCreated(GoogleMapController controller) async {
    mapController = controller;
    await marker();
    await addPolyLine();
    setState(() {});
  }

  marker() async {
    for (int i = 0; i < markerPointList.length; i++) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: markerPointList[i]['latLang'] as LatLng,
          anchor: const Offset(0.4, 0.5),
          infoWindow: markerPointList[i]['info'] != null
              ? InfoWindow(title: markerPointList[i]['info'].toString())
              : InfoWindow.noText,
          icon: BitmapDescriptor.fromBytes(
            await getBytesFromAsset(markerPointList[i]['image'].toString(), 60),
          ),
        ),
      );
    }
  }

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: points,
      width: 3,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }
}
