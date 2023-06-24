// import 'package:flutter/material.dart';
//
// import '../../../../model/doctor_model.dart';
//
//
// class CustomTab extends StatelessWidget {
//   final DoctorModel doctorModel;
//
//   const CustomTab({super.key, required this.doctorModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   height: 30,
//                   decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(25.0)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(2),
//                     child: TabBar(
//                       indicator: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(25.0)
//                       ),
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.black,
//                       tabs: const [
//                         Tab(text: "Info"),
//                         Tab(text: "Experience"),
//                         Tab(text: "Review"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//           SizedBox(
//           height: 80,
//                   child: TabBarView(
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(left: 16,right: 16),
//                         // color:Colors.grey.shade300,
//                         child: Center(
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 SizedBox(height: 10,),
//                                 Text("For getting instant advise ",
//                                   style: TextStyle(fontWeight: FontWeight.bold),),
//                                 SizedBox(height: 10,),
//                                 Text("Firady - Monday: 02:00 PM - 8:00 PM"),
//
//                               ]
//
//                           ),
//                         ),
//                       ),
//                       Center(child: Text(doctorModel.experience)),
//                       Center(child: Text(doctorModel.rating))
//                     ],
//                   )
//               ),
//
//             ],
//           )
//       ),
//     );
//   }
// }