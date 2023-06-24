// import 'package:doctor_app/model/doctor_model.dart';
// import 'package:flutter/material.dart';
//
// import 'doctors_profile/doctor_full_profile.dart';
// import 'doctors_profile/doctor_short_profile.dart';
//
// class TypeWiseList extends StatelessWidget {
//   final List<DoctorModel> typeWiseList;
//
//
//   const TypeWiseList({super.key, required this.typeWiseList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         title:       const SizedBox(
//             height: 40,
//             child: TextField(
//               decoration: InputDecoration(
//
//                   filled: true,
//                   hintText:
//                   "নাম/কোড অথবা ডিপার্টমেন্ট দ্বারা ডাক্তার খুঁজুন",
//                   hintStyle: TextStyle(fontSize: 14),
//                   suffixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder()),
//             )),
//         ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//             gridDelegate:
//                 const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
//             itemCount: typeWiseList.length,
//             itemBuilder: (context, index) {
//               DoctorModel doctorModel = typeWiseList[index];
//               return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => DoctorFullProfile(
//                                   doctorModel: doctorModel,
//                                 )));
//                   },
//                   child: DoctorShortProfile(doctorModel: doctorModel));
//             }),
//       ),
//     );
//   }
// }
