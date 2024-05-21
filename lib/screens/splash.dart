import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

import '../data/local/service/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      /// todo check if login before
      if (Get.find<AuthService>().rememberAccount()) {
        Navigator.pushNamed(context, '/bottomBar');
      }

      /// Navigator.pushNamed(context, '/bottomBar');
      else {
        Navigator.pushNamed(context, '/onboarding');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          shrinkWrap: true,
          children: [

            const Text(
              "Car Pooling",
              style: semibold28White,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
