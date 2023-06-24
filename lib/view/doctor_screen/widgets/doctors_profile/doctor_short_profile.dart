// import 'package:doctor_app/model/doctor_model.dart';
// import 'package:flutter/material.dart';
//
// class DoctorShortProfile extends StatelessWidget {
//   final DoctorModel doctorModel;
//
//   const DoctorShortProfile({super.key, required this.doctorModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors.grey.shade300,
//               child: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     child: Stack(
//                       children: [
//                         Container(
//                             padding: const EdgeInsets.all(16),
//                             height: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Colors.grey,
//                             ),
//                             child: Image.asset(doctorModel.image)),
//                         Positioned(
//                             top: 130,
//                             left: 40,
//                             child: Container(
//                               height: 20,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   color: Colors.lightGreen,
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: Center(child: Text(doctorModel.status)),
//                             ))
//                       ],
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(left: 4),
//                     child: Column(
//                       children: [
//                         Text(
//                           doctorModel.name,
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(doctorModel.title),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(doctorModel.qualification)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text("Total Experience"),
//                       Text("┃"),
//                       Text("Total Rating"),
//                       Text("┃"),
//                       Text("BMDC Number")
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         doctorModel.experience,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         doctorModel.rating,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         doctorModel.bmdc,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text("Workplace"),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     doctorModel.workPLace,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//
//                 ],
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
