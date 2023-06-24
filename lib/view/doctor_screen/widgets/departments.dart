
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import 'custom_card.dart';

class Departments extends StatefulWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  void initState() {
    fetchDepartments();
    super.initState();
  }

  void fetchDepartments() async {
    try {
      final AppController appController = Get.find();
      await appController.fetchDepartments(appController.token!, context);
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return Obx(
      () {
        if (appController.departments.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 200,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, mainAxisExtent: 124),
                      itemCount: appController.departments.length,
                      itemBuilder: (context, index) {
                        final department = appController.departments[index];
                        return CustomCard(
                            image: department.icon, title: department.name);
                      },
                    ))
              ]);
        }
      },
    );
  }
}
