import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class AddNewVehicleScreen extends StatefulWidget {
  const AddNewVehicleScreen({super.key});

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
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
          "Thêm thông tin phương tiện",
          style: semibold18White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          vehicleImage(),
          heightSpace,
          heightSpace,
          heightSpace,
          vehicleNameField(),
          heightSpace,
          heightSpace,
          vehicleTypeField(),
          heightSpace,
          heightSpace,
          vehicleRegNumberField(),
          heightSpace,
          heightSpace,
          vehicleColourField(),
          heightSpace,
          heightSpace,
          seatOfferingField(),
          heightSpace,
          heightSpace,
          facilitiesField(size)
        ],
      ),
      bottomNavigationBar: addButton(context),
    );
  }

  addButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(fixPadding * 2.0),
          padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 1.4, horizontal: fixPadding * 2.0),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: secondaryColor.withOpacity(0.1),
                blurRadius: 12.0,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: const Text(
            "Thêm",
            style: bold18White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  facilitiesField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Tiện ích"),
        heightSpace,
        Container(
          height: size.height * 0.13,
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
          child: const TextField(
            expands: true,
            maxLines: null,
            minLines: null,
            cursorColor: primaryColor,
            style: semibold15Black33,
            decoration: InputDecoration(
              hintText: "Nhập tiện ích",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  seatOfferingField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Chỗ ngồi"),
        heightSpace,
        Container(
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
          child: const TextField(
            cursorColor: primaryColor,
            style: semibold15Black33,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Số chỗ ngồi",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  vehicleColourField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Màu xe"),
        heightSpace,
        Container(
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
          child: const TextField(
            cursorColor: primaryColor,
            style: semibold15Black33,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "Nhập màu xe",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  vehicleRegNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Biển số xe"),
        heightSpace,
        Container(
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
          child: const TextField(
            cursorColor: primaryColor,
            style: semibold15Black33,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: "Nhập biển số xe",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  vehicleTypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Loại xe"),
        heightSpace,
        Container(
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
          child: const TextField(
            cursorColor: primaryColor,
            style: semibold15Black33,
            decoration: InputDecoration(
              hintText: "Nhập loại xe ",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  vehicleNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("Tên xe"),
        heightSpace,
        Container(
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
          child: const TextField(
            cursorColor: primaryColor,
            keyboardType: TextInputType.name,
            style: semibold15Black33,
            decoration: InputDecoration(
              hintText: "Nhập tên xe",
              hintStyle: medium15Grey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: fixPadding, vertical: fixPadding * 1.4),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }

  title(String title) {
    return Text(
      title,
      style: semibold15Black33,
    );
  }

  vehicleImage() {
    return InkWell(
      onTap: () {
        addImageBottonsheet();
      },
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: const Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.camera,
              size: 35.0,
              color: greyColor,
            ),
            heightBox(fixPadding * 0.8),
            const Text(
              "Thêm ảnh chi tiết xe",
              style: semibold14Grey,
            )
          ],
        ),
      ),
    );
  }

  addImageBottonsheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Text(
              "Thêm ảnh",
              style: semibold18Black33,
            ),
            heightSpace,
            heightSpace,
            imageChangeOption(Icons.camera_alt, darkBlueColor, "Camera"),
            heightSpace,
            heightSpace,
            imageChangeOption(Icons.photo, darkGreenColor, "Bộ sưu tập"),
          ],
        );
      },
    );
  }

  imageChangeOption(IconData icon, Color color, String title) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 6.0,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 23.0,
              color: color,
            ),
          ),
          widthSpace,
          width5Space,
          Expanded(
            child: Text(
              title,
              style: medium16Black33,
            ),
          ),
        ],
      ),
    );
  }
}
