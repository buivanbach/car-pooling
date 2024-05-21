import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_gopoolar/core/Algo/map.dart';
import 'package:rc_fl_gopoolar/router/app_router.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';
import 'package:rc_fl_gopoolar/screens/screens.dart';

import 'package:get/get.dart';


import 'data/local/preference/preference_manager.dart';
import 'data/local/preference/preference_manager_impl.dart';
import 'data/local/service/auth_service.dart';
import 'data/local/service/setting_service.dart';
Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<PreferenceManager>(() => PreferenceManagerImpl().init(), tag: (PreferenceManager).toString());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => SettingService().init(), permanent: true);

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: 'vncss-dev');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: 'Car Pooling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        primaryColor: primaryColor,
        fontFamily: 'Montserrat',
      ),
      home: SplashScreen(),
      onGenerateRoute: AppRouter.routes,
    );
  }
}


