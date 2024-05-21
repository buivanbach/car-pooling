import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class MyRidesScreen extends StatefulWidget {
  const MyRidesScreen({super.key});

  @override
  State<MyRidesScreen> createState() => _MyRidesScreenState();
}

class _MyRidesScreenState extends State<MyRidesScreen> {
  final ridesList = [
    {
      "image": "assets/myRides/image-1.png",
      "name": "Tạ Thành Baảo",
      "date": "Hôm nay",
      "time": "9:00 am",
      "pickup": "Vincom Mega Mall Ocean Park",
      "destination": "144, Xuân Thủy, Dịch Vong Hậu, Cầu Giấy, Hà Nội"
    },
    {
      "image": "assets/myRides/image-2.png",
      "name": "Bùi Văn Bách",
      "date": "19/05/2024",
      "time": "9:00 am",
      "pickup": "64, Phạm Văn Đồng, Mai Dịch, Cầu Giấy, Hà Nội",
      "destination": "Cầu Vĩnh Tuy, Hà Nội, Việt Nam"
    },
    {
      "image": "assets/myRides/image-3.png",
      "name": "Bảo Tà",
      "date": "20/05/2024",
      "time": "9:00 am",
      "pickup": "26B Trần Hưng Đạo, Phan Chu Trinh, Hoàn Kiếm, Hà Nội",
      "destination": "1 Hùng Vương, Điện Biên, Ba Đình, Hà Nội"
    },
    {
      "image": "assets/myRides/image-4.png",
      "name": "Trấn Thành",
      "date": "19/05/2024",
      "time": "9:00 am",
      "pickup": "106 P. Chùa Láng, Láng Thượng, Hai Bà Trưng, Hà Nội",
      "destination": "P. Phạm Văn Bạch, Yên Hoà, Cầu Giấy, Hà Nội"
    },

  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: f8Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 20.0,
        title: const Text(
          "Chuyến đi của bạn",
          style: semibold18White,
        ),
        actions: [
          requestsIconButton(),
        ],
      ),
      body: ridesList.isEmpty ? emptyListContent() : ridesListContent(size),
    );
  }

  emptyListContent() {
    return Center(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/myRides/no-car.png",
            height: 50.0,
          ),
          heightSpace,
          const Text(
            "Chưa có chuyến đi nào",
            style: semibold16Black33,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  ridesListContent(Size size) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: ridesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            final results = await Navigator.pushNamed(context, '/rideDetail',
                arguments: {"id": 1});
            if (results == "Cancel") {
              setState(() {
                ridesList.removeAt(index);
              });
            }
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(fixPadding),
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.15),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: AssetImage(
                        ridesList[index]['image'].toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ridesList[index]['name'].toString(),
                        style: semibold15Black33,
                        overflow: TextOverflow.ellipsis,
                      ),
                      height5Space,
                      Row(
                        children: [
                          dateTimeWidget(size, Icons.calendar_month_outlined,
                              ridesList[index]['date'].toString()),
                          const Text(
                            " | ",
                            style: medium12Black33,
                          ),
                          dateTimeWidget(size, Icons.access_time,
                              ridesList[index]['time'].toString()),
                        ],
                      ),
                      height5Space,
                      address(
                          greenColor, ridesList[index]['pickup'].toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 0.6),
                        child: DottedBorder(
                          padding: EdgeInsets.zero,
                          dashPattern: const [1.9, 3.9],
                          color: greyColor,
                          strokeWidth: 1.2,
                          child: const SizedBox(height: 6.0),
                        ),
                      ),
                      address(
                          redColor, ridesList[index]['destination'].toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  dateTimeWidget(Size size, IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: black33Color,
          size: 14.0,
        ),
        width5Space,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.2),
          child: Text(
            title,
            style: medium12Black33,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  address(Color color, String address) {
    return Row(
      children: [
        Container(
          height: 12.0,
          width: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.location_pin,
            color: color,
            size: 9.0,
          ),
        ),
        widthSpace,
        Expanded(
          child: Text(
            address,
            style: medium12Grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  requestsIconButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: fixPadding * 2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/rideRequest');
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 25.0,
                width: 25.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.person_fill,
                  color: primaryColor,
                  size: 20.0,
                ),
              ),
              Positioned(
                top: -4,
                right: 0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: redColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
