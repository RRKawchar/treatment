import 'package:flutter/material.dart';
import 'package:treatment/view/doctor_screen/widgets/symptoms.dart';

import 'departments.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25.0)),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: "Departments"),
                    Tab(text: "Symptoms"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 300,
              child: TabBarView(
                children: [Departments(), SymptomsCategory()],
              )),
        ],
      )),
    );
  }
}
