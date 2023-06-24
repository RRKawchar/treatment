import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treatment/view/doctor_screen/widgets/bold_text.dart';
import 'package:treatment/view/doctor_screen/widgets/custom_tab_bar.dart';
import 'package:treatment/view/doctor_screen/widgets/doctors_list.dart';
import 'package:treatment/view/doctor_screen/widgets/instant_consulting_doctors.dart';
import 'package:treatment/view/doctor_screen/widgets/specialist_doctors.dart';
import '../../controllers/app_controller.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  void initState() {
    fetchDoctors();
    super.initState();
  }

  fetchDoctors() async {
    final AppController appController = Get.find();
    final token = appController.token;
    await appController.fetchAllDoctors(token!, context);
  }

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          toolbarHeight: 110,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.video_camera_back),
                    TextButton(
                        onPressed: () {}, child: const Text("ভিডিও কনসাল্টেশন"))
                  ],
                ),
                const SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText:
                              "নাম/কোড অথবা ডিপার্টমেন্ট দ্বারা ডাক্তার খুঁজুন",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder()),
                    )),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.blueGrey,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text("দিন-রাত ২৪ ঘন্টা",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("অভিজ্ঞ এমবিবিএস ডাক্তারের পরামর্শ নিন",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                          Text("৯০% ডিস্কাউন্টে",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                Obx(() {
                  if (appController.doctors.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const BoldText(text: "তাৎক্ষণিক ভিডিও কন্সাল্টেশন নিন"),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InstantConsultingDoctor(
                          doctors: appController.doctors,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const BoldText(text: "বিশেষজ্ঞ ডাক্তারের পরামর্শ নিন"),
                        const SizedBox(
                          height: 8,
                        ),
                        SpecialistDoctors(
                          doctors: appController.doctors,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(),
                        const Divider(),
                        const BoldText(text: "Choose a symptom or department"),
                        const Text("Find your doctor as your need"),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 700, child: CustomTabBar()),
                        const Divider(),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BoldText(
                              text: "Available Doctors",
                            ),
                            SizedBox(
                              height: 20,
                              child: OutlinedButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   showFullList = !showFullList;
                                    // });
                                  },
                                  child: const Text("View All")),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1100,
                          child: AllDoctors(),
                        )
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
