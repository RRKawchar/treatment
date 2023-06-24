
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treatment/view/more_screen/widgets/update_fees.dart';

import '../../controllers/app_controller.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    TextEditingController nameController = TextEditingController(
        text: appController.doctorProfile.value!.data.name);
    TextEditingController phoneController = TextEditingController(
        text: appController.doctorProfile.value!.data.phone);
    TextEditingController emailController = TextEditingController(
        text: appController.doctorProfile.value!.data.email);
    TextEditingController genderController = TextEditingController(
        text: appController.doctorProfile.value!.data.email);
    TextEditingController aboutController = TextEditingController(
        text: appController.doctorProfile.value!.data.about);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(radius: 55, child: Icon(Icons.camera_alt)),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      hintText: 'Name',
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
              const Text(
                'Phone',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone),
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
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
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
              const Text(
                'Gender',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      hintText: 'Gender',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'About',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: aboutController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      hintText: 'About',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: appController
                              .doctorProfile.value!.data.experience.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Designation:"),
                                Text(appController.doctorProfile.value!.data
                                    .experience[index].designation),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text("Dept. ID:"),
                                Text(appController.doctorProfile.value!.data
                                    .experience[index].departmentId),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text("Emp. Status:"),
                                Text(appController.doctorProfile.value!.data
                                    .experience[index].employmentStatus),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text("Period:"),
                                Text(appController.doctorProfile.value!.data
                                    .experience[index].period),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Fees",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: appController
                              .doctorProfile.value!.data.info.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    const Text("Consultation fees",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 250),
                                      child: InkWell(
                                          child: const Icon(Icons.edit),
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return UpdateFees(
                                                  doctorInfo: appController
                                                      .doctorProfile
                                                      .value!
                                                      .data
                                                      .info[index]);
                                            }));
                                          }),
                                    )
                                  ],
                                ),
                               Obx(()=> Text(appController.doctorProfile.value!.data
                                    .info[index].consultationFee)),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text("Followup fee",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                            Obx(()=>Text(appController.doctorProfile.value!.data
                                    .info[index].followUpFee)),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        )

    );
  }
}
