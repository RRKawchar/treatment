

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:treatment/view/more_screen/user_profile_screen.dart';
import 'package:treatment/view/more_screen/widgets/reusable_profile_text_bold.dart';
import 'package:treatment/view/more_screen/widgets/user_profile_card.dart';
import '../../controllers/app_controller.dart';
import 'doctor_profile_screen.dart';

class MoreScreen extends StatefulWidget {

  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  bool status = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final AppController appController = Get.find();
    await appController.fetchDoctorProfile(appController.token!,context);
    await appController.fetchUserProfile(appController.token!);
    await appController.fetchAgentProfile(appController.token!);
  }

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    if (appController.doctorProfile.value?.success != true &&
        appController.userProfile.value?.username.isEmpty == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.white,
            title: const Text("Profile"),
          ),
          body:Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
                child:    Obx(() {
                  if (appController.doctorProfile.value != null &&
                      appController.userProfile.value != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const CircleAvatar(
                                  radius: 40,
                                  foregroundImage:
                                  AssetImage("assets/images/profile.png"),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    appController.usertype == "user" ? appController
                                        .userProfile.value!.name : appController
                                        .usertype == "agent"
                                        ? appController.agentProfile.value!.name
                                        : appController.doctorProfile.value!.data
                                        .name),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    appController.usertype == "user" ? appController
                                        .userProfile.value!.phone : appController
                                        .usertype == "agent"
                                        ? appController.agentProfile.value!.phone
                                        : appController.doctorProfile.value!.data
                                        .phone),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        appController.usertype == "user" ||
                                            appController.usertype == "agent"
                                            ? const UserProfileScreen()
                                            : const DoctorProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "View your profile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            FlutterSwitch(
                              width: 68.0,
                              height: 32.0,
                              activeText: "বাং",
                              inactiveText: "En",
                              valueFontSize: 12.0,
                              toggleSize: 42.0,
                              value: status,
                              borderRadius: 30.0,
                              showOnOff: true,
                              onToggle: (val) {
                                status = val;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "0",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("Points"),
                              ],
                            ),
                            Column(
                              children: const [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.lightGreen,
                                  foregroundImage:
                                  AssetImage("assets/images/profile.png"),
                                ),
                                Text("Tap to see all patients "),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const ProfileTextBold(text: "Records"),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 150,
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 130,
                                child: UserProfileCard(
                                  image: "assets/images/prescription.png",
                                  text: "See all prescriptions",
                                ),
                              ),
                              SizedBox(
                                width: 130,
                                child: UserProfileCard(
                                  image: "assets/images/test.png",
                                  text: "All test reports",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProfileTextBold(text: "Health care package"),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          width: 130,
                          height: 160,
                          child: UserProfileCard(
                            image: "assets/images/healthcare.png",
                            text: "Healthcare packages",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProfileTextBold(text: "Consultation"),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 360,
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 150,
                            ),
                            children: const [
                              SizedBox(
                                width: 135,
                                height: 100,
                                child: UserProfileCard(
                                  image: "assets/images/past.png",
                                  text: "Past consultation",
                                ),
                              ),
                              UserProfileCard(
                                image: "assets/images/upcoming.png",
                                text: "Upcoming",
                              ),
                              UserProfileCard(
                                image: "assets/images/calendar.png",
                                text: "Appointment",
                              ),
                              UserProfileCard(
                                image: "assets/images/realtime.png",
                                text: "Recently viewed",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProfileTextBold(text: "Offer & rewards"),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 140,
                          width: 130,
                          child: UserProfileCard(
                            image: "assets/images/offer.png",
                            text: "Referral",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProfileTextBold(text: "Payments"),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 140,
                          width: 130,
                          child: UserProfileCard(
                            image: "assets/images/pay.png",
                            text: "Transaction history",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const ProfileTextBold(text: "Engagements"),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 140,
                          width: 130,
                          child: UserProfileCard(
                            image: "assets/images/favourite.png",
                            text: "Favorite doctors",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ProfileTextBold(text: "Legal and support"),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Terms and condition",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Privacy policy",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Payment terms",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Frequently Asked Questions",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "About us",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Contact us",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            appController.logout();
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        Row(
                          children: const [
                            Expanded(child: SizedBox()),
                            Text(
                              "v1.00",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                } )

            ),
          )
      ),


    );
  }
}



