import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../api_services/api_service.dart';
import '../../../api_services/doctor_service.dart';

import '../../../model/doctor_model.dart';

import 'doctor_overview.dart';

class InstantConsultingDoctor extends StatefulWidget {
  final List<DoctorData> doctors;
  const InstantConsultingDoctor({Key? key, required this.doctors})
      : super(key: key);

  @override
  State<InstantConsultingDoctor> createState() =>
      _InstantConsultingDoctorState();
}

class _InstantConsultingDoctorState extends State<InstantConsultingDoctor> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: widget.doctors
              .map(
                (item) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorOverview()));
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                            padding: const EdgeInsets.all(24),
                            height: 100,
                            width: 100,
                            child: item.profilePicture == null
                                ? Image.asset(
                                    "assets/images/stetho.png",
                                    height: 55,
                                  )
                                : Image.network(item.profilePicture)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.video_call,
                            size: 20,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(item.name, style: const TextStyle(fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
