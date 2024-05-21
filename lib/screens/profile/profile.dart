import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

import '../../data/local/service/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: f8Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 20.0,
        title: const Text(
          "Cài đặt",
          style: semibold18White,
        ),
      ),
      body: Column(
        children: [
          userDetail(),
          profileOptions(context),
        ],
      ),
    );
  }

  profileOptions(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        color: whiteColor,
        child: ListView(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          children: [
            imageProfileOption("assets/profile/car-line.png", "Xe của tôi",
                "Thông tin về phương tiện của tôi", () {
              Navigator.pushNamed(context, '/myVehicle');
            }),
            divider(),
            iconProfileOption(
                Icons.history, "Lịch sử chuyến đi", "Xem tất cả những chuyến đi của bạn", () {
              Navigator.pushNamed(context, '/rideHistory');
            }),
            divider(),
            iconProfileOption(CupertinoIcons.square_list, "Các điều khoản và điều kiện",
                "Ấn để xem thêm thông tin", () {
              Navigator.pushNamed(context, '/termsAndCondition');
            }),
            divider(),
            iconProfileOption(CupertinoIcons.exclamationmark_shield,
                "Chính sách", "Thêm thông tin về chính sách của chúng tôi", () {
              Navigator.pushNamed(context, '/privacyPolicy');
            }),
            divider(),
            iconProfileOption(CupertinoIcons.question_circle, "FAQs",
                "Hỏi đáp", () {
              Navigator.pushNamed(context, '/faqs');
            }),
            divider(),
            imageProfileOption("assets/profile/headset.png", 'Hỗ trợ khách hàng',
                "Liên hệ chúng tôi nếu bạn gặp bất kỳ khó khăn gì", () {
              Navigator.pushNamed(context, '/customerSupport');
            }),
            divider(),
            imageProfileOption(
                "assets/profile/logout.png", "Đăng xuất", "Đăng xuất tài khoản",
                () {
              logoutDialog();
            }, color: redColor),
          ],
        ),
      ),
    );
  }

  logoutDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: whiteColor,
          insetPadding: const EdgeInsets.all(fixPadding * 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: fixPadding * 2.4, horizontal: fixPadding * 2.0),
                child: Text(
                  "Bạn có muốn đăng xuất?",
                  style: semibold16Black33,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding, vertical: fixPadding * 1.2),
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: const Text(
                          "Không",
                          style: semibold18White,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  widthBox(2.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<AuthService>().signOut();
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding, vertical: fixPadding * 1.2),
                        color: secondaryColor,
                        alignment: Alignment.center,
                        child: const Text(
                          "Đăng xuất",
                          style: semibold18White,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  iconProfileOption(
      IconData icon, String title, String subTitle, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18.0,
            color: black33Color,
          ),
          widthSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: semibold16Black33,
                      ),
                      heightBox(2.0),
                      Text(
                        subTitle,
                        style: medium14Grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                width5Space,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: black33Color,
                  size: 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  imageProfileOption(
      String image, String title, String subTitle, Function() onTap,
      {Color color = black33Color}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18.0,
            width: 18.0,
            alignment: Alignment.center,
            child: Image.asset(
              image,
              height: 16.0,
              width: 16.0,
              color: color,
            ),
          ),
          widthSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: semibold16Black33.copyWith(color: color),
                      ),
                      heightBox(2.0),
                      Text(
                        subTitle,
                        style: medium14Grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                width5Space,
                const Icon(
                  Icons.arrow_forward_ios,
                  color: black33Color,
                  size: 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.8),
      width: double.maxFinite,
      height: 1.0,
      color: greyD4Color,
    );
  }

  userDetail() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        children: [
          Container(
            height: 75.0,
            width: 75.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/profile/user-image.png",
                ),
              ),
            ),
          ),
          widthSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tạ Thành Bảo",
                  style: semibold17Black33,
                  overflow: TextOverflow.ellipsis,
                ),
                height5Space,
                Text(
                  "baobk@mail.com",
                  style: semibold16Grey,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/editProfile');
            },
            child: const Iconify(
              MaterialSymbols.edit_square_outline_rounded,
              color: secondaryColor,
              size: 23,
            ),
          )
        ],
      ),
    );
  }
}
