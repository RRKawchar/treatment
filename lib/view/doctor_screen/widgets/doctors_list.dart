import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/app_controller.dart';
import '../../../model/doctor_model.dart';
import 'doctors_profile/doctor_full_profile.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          if (appController.doctors.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              height: 1000,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 340,
                ),
                itemCount: appController.doctors.length,
                itemBuilder: (context, index) {
                  DoctorData doctor = appController.doctors[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorFullProfile(doctorData: doctor),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Card(
                                elevation: 3,
                                child: SizedBox(
                                  height: 150,
                                  width: 145,
                                  child: Center(
                                    child: doctor.profilePicture == null
                                        ? Image.asset(
                                      "assets/images/stetho.png",
                                      height: 55,
                                    )
                                        : Image.network(doctor.profilePicture),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 12,
                                child: Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      doctor.status == true
                                          ? "Online"
                                          : "Offline",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              itemCount: doctor.position.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  "Position: ${doctor.position[index]}",
                                );
                              },
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                "(200)",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              // Text(doctor.,style: const TextStyle(fontSize: 10),),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              itemCount: doctor.info.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  "Consultation fees: ${doctor.info.first
                                      .consultationFee}",
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: const [
                                  Icon(Icons.video_call),
                                  Text("ডাক্তার দেখান"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ],
    );
  }
}