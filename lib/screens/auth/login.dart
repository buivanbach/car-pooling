import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  DateTime? backPressTime;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool key) {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: Column(
            children: [
              headerImage(size),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    loginTitle(),
                    heightSpace,
                    welcomeText(),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    mobileNumberField(),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    loginButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginButton() {
    return InkWell(
      onTap: () {
        print('here');
        if (phoneKey.currentState?.validate() == true) {
          Navigator.pushNamed(context, '/register');
        }
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding * 1.4),
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
        alignment: Alignment.center,
        child: const Text(
          "Đăng nhập",
          style: bold18White,
        ),
      ),
    );
  }

  mobileNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Form(
        key: phoneKey,
        child: IntlPhoneField(

          controller: phoneController,
          validator: (text) {
            if (text == null) {
              return 'Không được để trống!';
            }
            if (text.number.trim().isEmpty) {
              return 'Không được để trống!';
            }
            return null;
          },
          disableLengthCheck: true,
          showCountryFlag: false,
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: black33Color,
            size: 20.0,
          ),
          cursorColor: primaryColor,
          style: semibold15Black33,
          initialCountryCode: 'VN',
          dropdownTextStyle: semibold15Black33,
          flagsButtonMargin:
              const EdgeInsets.symmetric(horizontal: fixPadding * 0.7),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Nhập số điện thoại của bạn",
            hintStyle: semibold15Grey,
            contentPadding: EdgeInsets.symmetric(vertical: fixPadding * 1.4),
          ),
        ),
      ),
    );
  }

  welcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Text(
        "Xin chào, hãy đăng nhập với số điện thoại của bạn",
        style: medium15Grey,
        textAlign: TextAlign.center,
      ),
    );
  }

  loginTitle() {
    return const Text(
      "Đăng nhập",
      style: semibold20Black33,
      textAlign: TextAlign.center,
    );
  }

  headerImage(Size size) {
    return Container(
      padding: const EdgeInsets.only(top: fixPadding * 1.5),
      width: double.maxFinite,
      height: size.height * 0.4,
      color: primaryColor,
      alignment: Alignment.center,
      child: Image.asset(
        "assets/auth/header-image.png",
        height: size.height * 0.22,
        fit: BoxFit.cover,
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) > const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          backgroundColor: blackColor,
          content: Text(
            "Xác nhận lần nữa để thoát ứng dụng",
            style: semibold15White,
          ),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
