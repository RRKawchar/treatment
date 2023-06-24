import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_services/api_service.dart';
import '../../../model/doctor_model.dart';

class UpdateExperience extends StatefulWidget {
  final DoctorExperience doctorExperience;

  const UpdateExperience({Key? key, required this.doctorExperience})
      : super(key: key);

  @override
  State<UpdateExperience> createState() => _UpdateExperienceState();
}

class _UpdateExperienceState extends State<UpdateExperience> {
  @override
  Widget build(BuildContext context) {
    final appController = Get.find();
    final token = appController.token;
    TextEditingController designationController =
        TextEditingController(text: widget.doctorExperience.designation);
    TextEditingController departmentId = TextEditingController(
        text: "Department id: ${widget.doctorExperience.departmentId}");
    TextEditingController employmentStatus =
        TextEditingController(text: widget.doctorExperience.employmentStatus);
    TextEditingController period =
        TextEditingController(text: widget.doctorExperience.period);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Experience",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                maxLines: 2,
                controller: designationController,
                decoration: InputDecoration(
                    hintText: "Designation",
                    contentPadding: const EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide()),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide())),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: departmentId,
                  decoration: InputDecoration(
                      hintText: "D.ID",
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: employmentStatus,
                  decoration: InputDecoration(
                      hintText: "E. status",
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: period,
                  decoration: InputDecoration(
                      hintText: "period",
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await ApiService.updateExperience(
                            token!,
                            widget.doctorExperience.designation,
                            widget.doctorExperience.departmentId,
                            widget.doctorExperience.employmentStatus,
                            widget.doctorExperience.period);
                      },
                      child: const Text("Update Experience"))),
            ],
          ),
        ),
      ),
    );
  }
}
