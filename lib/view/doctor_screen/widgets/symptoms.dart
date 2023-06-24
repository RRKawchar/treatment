import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/app_controller.dart';

import 'custom_card.dart';

class SymptomsCategory extends StatefulWidget {
  const SymptomsCategory({super.key});

  @override
  State<SymptomsCategory> createState() => _SymptomsCategoryState();
}

class _SymptomsCategoryState extends State<SymptomsCategory> {

@override
  void initState() {
    fetchSymptoms();
    super.initState();
  }
  void fetchSymptoms()async{
  try{
    final AppController appController = Get.find();
    await appController.getAllSymptoms(appController.token!, context);
  }
  catch(error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
  }
  }

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return   Obx(() {
      if (appController.symptoms.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          SizedBox(
              height: 200,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisExtent: 124),
                itemCount: appController.symptoms.length,
                itemBuilder: (context, index) {
                  final symptom = appController.symptoms[
                  index];
                  return CustomCard(
                      image: symptom.icon, title: symptom.name);
                },
              )
          )


        ]);
      }

    }
    );
  }
}
