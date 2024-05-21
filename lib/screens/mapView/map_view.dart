import 'dart:async';
import 'dart:ui' as ui;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  GoogleMapController? mapController;

  static const CameraPosition currentPosition = CameraPosition(
    target: LatLng(21.06035516783402, 105.72430918867336),
    zoom: 12.00,
  );

  List<Marker> allMarkers = [];
  Map<PolylineId, Polyline> polylines = {};
  @override
  void initState() {
    // TODO: implement initState
   points.forEach((point){

   });
  }
  final points = [
    const LatLng(21.06035516783402, 105.72430918867336),
    const LatLng(21.03009764629784, 105.77847598214636),
    const LatLng(21.002698704759723, 105.87400165719149),
    const LatLng(20.996595528333135, 105.97099490608831),
  ];

  final markerPointList = [
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(21.06035516783402, 105.72430918867336)
    },
    {
      "image": "assets/mapView/destinationicon.png",
      "latLang": const LatLng(21.03009764629784, 105.77847598214636),
    },
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(21.002698704759723, 105.87400165719149),
    },
    {
      "image": "assets/mapView/pickupicon.png",
      "latLang": const LatLng(20.996595528333135, 105.97099490608831),
    },
    {
      "image": "assets/mapView/ride-start-icon.png",
      "latLang": const LatLng(20.927948764960345, 106.07492577493875),
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
          "Map view",
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
            initialChildSize: 0.45,
            maxChildSize: 0.55,
            minChildSize: 0.45,
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
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  children: [
                    const Text(
                      "Chuyến xe ",
                      style: semibold16Black33,
                    ),
                    heightSpace,
                    heightSpace,
                    step("Xe bắt đầu từ",
                        "Trạm Trôi,TT. Trạm Trôi, Hoài Đức, Hà Nội, Việt Nam"),
                    step("Điểm đón",
                        "Cầu Diễn, Nam Từ Liêm, Hà Nội, Việt Nam",
                        isPickDropPoint: true,
                        textColor: greenColor,
                        iconColor: greenColor),
                    step("Đi tiếp", "Đ. Bạch Đằng, Thanh Long, Hoàn Kiếm, Hà Nội"),
                    step("Điểm đến",
                        "Vincom Mega Mall Ocean Park",
                        isPickDropPoint: true, textColor: redColor),
                    step(
                        "Xe dừng:", "Vincom Mega Mall Ocean Park",
                        isDivider: false),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  step(String title, String subTitle,
      {isDivider = true,
      isPickDropPoint = false,
      iconColor = redColor,
      textColor = greyColor}) {
    return Row(
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
              style: medium14Grey.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
            height5Space,
            Text(
              subTitle,
              style: medium14Black33,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ))
      ],
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
          icon: BitmapDescriptor.fromBytes(
            await getBytesFromAsset(markerPointList[i]['image'].toString(), 70),
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
