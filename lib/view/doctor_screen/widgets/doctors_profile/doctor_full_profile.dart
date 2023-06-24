
import 'package:flutter/material.dart';


import '../../../../model/doctor_model.dart';


class DoctorFullProfile extends StatelessWidget {
  final DoctorData doctorData;

  const DoctorFullProfile({super.key, required this.doctorData});
  getStar(int stars){
    String star = "";
    for(int i = 0; i < stars; i++){
      star = "⭐$star";

    }
    return star;
  }
  @override
  Widget build(BuildContext context) {
    // final AppController appController = Get.find();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade300,
          actions:  const [
            InkWell(
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.share),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey.shade300,
              child: Row(
                children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                    ),
                    child: doctorData.profilePicture == null
                        ? Image.asset(
                            "assets/images/stetho.png",
                            height: 55,
                          )
                        : Image.network(doctorData.profilePicture)),
                Positioned(
                    top: 130,
                    left: 40,
                    child: Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(doctorData.status == true
                              ? "Online"
                              : "Offline")),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  Text(
                    doctorData.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
            height: 200,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctorData.experience.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Designation:"),
                              Text(
                                  doctorData.experience[index].designation),
                              const SizedBox(
                                height: 4,
                              ),
                               Text("Dept. ID: ${doctorData
                                  .experience[index].departmentId}"),

                              const SizedBox(
                                height: 4,
                              ),
                               Text("Emp. Status: ${doctorData
                                  .experience[index].employmentStatus}"),

                              const SizedBox(
                                height: 4,
                              ),
                              const Text("Period:"),
                              Text(doctorData.experience[index].period),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: const [
            //           Text("Total Experience"),
            //           Text("┃"),
            //           Text("Total Rating"),
            //           Text("┃"),
            //           Text("BMDC Number")
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             doctorModel.experience,
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           Text(
            //             doctorModel.rating,
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           Text(
            //             doctorModel.bmdc,
            //             style: const TextStyle(fontWeight: FontWeight.bold),
            //           )
            //         ],
            //       ),
            const SizedBox(
              height: 10,
            ),
            // const Text("Workplace"),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   doctorModel.workPLace,
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),

            // SizedBox(height:145,child: CustomTab(doctorData: doctorModel,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: doctorData.info.length,
          itemBuilder: (context, index) {
              return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Consultation fees",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(doctorData.info[index].consultationFee),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text("Followup fee",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(doctorData.info[index].followUpFee)
                  ]);
          }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:8),
              child: Text("Reviews",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 16
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctorData.reviews.length,
                    itemBuilder: (context, index) {
                      return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                             Text(getStar(int.parse(doctorData.reviews[index]['stars'])),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(doctorData.reviews[index]['review_text'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),

                          ]);
                    }),
              ),
            ),

          ]),
        ));
  }
}
  

