import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_services/auth_service.dart';
import '../controllers/app_controller.dart';
import '../global_widgets/bottom_bar.dart';


class SignInUtility {

  static Future<void> performDoctorAgentSignIn(context, String email, String password) async {
    try {
      final authService = AuthService();
      final token = await authService.loginDoctorAgent(email, password);
      print(token);
      if (token.isNotEmpty) {
        final AppController appController = Get.find();
        appController.setToken(token);


    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CustomBottomBar()), (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to obtain token from login")));
        print('');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to perform sign-in: $e")));

    }
  }
  static Future <void> performUserSignIn(context, String email, password) async {
    try {
      final authService = AuthService();
      final token = await authService.loginGeneralUser(email, password);
      print(token);
      if (token.isNotEmpty) {

        final AppController appController = Get.find();
        appController.setToken(token);


        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CustomBottomBar()), (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to obtain token from login")));

      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to perform sign-in: $e")));

    }
  }
}