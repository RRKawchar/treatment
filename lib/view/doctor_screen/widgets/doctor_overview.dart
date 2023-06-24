import 'package:flutter/material.dart';

import 'bold_text.dart';

class DoctorOverview extends StatelessWidget {
  const DoctorOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,title: const BoldText(text: "Overview"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                      child: Image.asset("assets/images/stetho.png")),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        BoldText(text: "Old disease expert",),
                      SizedBox(height: 10,),
                      Center(child: Text("We wii assign a doctor\nfor you ")),

                    ],),
                  )

                ],
              ),

            const Divider(color: Colors.grey,),
            const SizedBox(height: 10,),
            const Text("Patient info"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const CircleAvatar(foregroundImage: AssetImage("assets/images/profile.png"),),
              const Text("012345678"),Container(height: 20,width: 60,decoration:  BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(15)),child: const Center(child: Text("myself"),),), SizedBox(height:25,child: ElevatedButton(onPressed: (){}, child: const Text("Tap for other"))),

            ],),
            const SizedBox(height: 20,),
            Row(

              children: const [
              Icon(Icons.check_circle,color: Colors.red,),SizedBox(width: 10,),Text("You can submit your medical\nhistory in the next page",)
            ],),

              const SizedBox(height: 12,),
            const Divider(color: Colors.grey,),
              const SizedBox(height: 12,),
            const BoldText(text: "Payment Details"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
              Text("Consultation fee"),Text("৳420.00"),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Vat(5%)"),Text("৳21.00"),
              ],),
            const Divider(color: Colors.grey,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              BoldText(text: "Net Amount"),BoldText(text: "৳441.00"),

            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              const Icon(Icons.local_offer),const Text("Do you have coupon code"),IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next)),

            ],),
            const BoldText(text: "Payment Method")




          ],),
        ),
      ),
    );
  }
}
