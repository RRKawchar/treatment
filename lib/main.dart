
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:flutter/material.dart';
import 'package:treatment/view/allConsults/allConsults.dart';
import 'package:treatment/view/appointmentBooking/appointmentBooking.dart';
import 'package:treatment/view/consultPage/consultPage.dart';
import 'package:treatment/view/doctorPage/doctorPage.dart';
import 'package:treatment/view/home/home.dart';
import 'package:treatment/view/splash_screen/splash_screen.dart';

import 'controllers/api_controller.dart';
import 'controllers/app_controller.dart';
import 'global_widgets/bottom_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    final ApiController apiController = Get.put(ApiController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        if (appController.token != null && appController.token!.isNotEmpty) {

          return const CustomBottomBar();
        } else {
          return const SplashScreen();
        }
      }),
    );
  }
}



