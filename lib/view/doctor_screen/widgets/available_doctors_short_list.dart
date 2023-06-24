// import 'package:doctor_app/model/doctor_model.dart';
// import 'package:flutter/material.dart';
// import 'doctors_profile/doctor_full_profile.dart';
//
// class AvailableDoctorsShortList extends StatefulWidget {
//
//   const AvailableDoctorsShortList({ super.key});
//
//   @override
//   State<AvailableDoctorsShortList> createState() => _AvailableDoctorsShortListState();
// }
//
// class _AvailableDoctorsShortListState extends State<AvailableDoctorsShortList> {
//   List <DoctorModel> shortList = [
//   ];
//   @override
//   void initState() {
//     setState(() {
//       shortList = DoctorModel.doctorsListFull.where((element) => element.status=="Online").toList();
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//         SizedBox(
//           height: 1100,
//           child: GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//
//                   crossAxisCount: 2,mainAxisExtent: 280),itemCount:shortList.length,itemBuilder:(context,index){
//             DoctorModel dm = shortList[index];
//             return InkWell(
//               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorFullProfile(doctorModel: dm)));},
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//
//                   children: [
//                     Stack(
//                       children: [
//                         Card(elevation: 3,child: SizedBox(height:150,width:145,child: Center(child: Image.asset(dm.image,height: 55,)))),
//                         Positioned(left:12,top:12,child: Container(height:20,width: 60,decoration: BoxDecoration(color: Colors.lightGreen,borderRadius: BorderRadius.circular(50)),child: Center(child: Text(dm.status)),))
//                       ],
//                     ),
//                     Text(dm.name,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
//                     Text(dm.qualification),
//                     Row(
//                         children: [
//                           const Icon(Icons.star,color: Colors.amber,size: 20,),
//                           Text("${dm.rating}(200)",style: const TextStyle(fontSize: 10),),
//                           const SizedBox(width: 20,),
//                           Text(dm.experience,style: const TextStyle(fontSize: 10),),
//                         ]
//                     ),
//
//                     Text("৳${dm.fee}(ভ্যাটসহ)"),
//                     SizedBox(
//                       height:30,
//                       child: OutlinedButton(onPressed: (){}, child: Row(
//                         mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Icon(Icons.video_call),Text("ডাক্তার দেখান")
//                         ],)),
//                     )
//
//
//                   ],),
//               ),
//             );
//           }),
//         )
//       ]
//       );
//   }
// }
//
