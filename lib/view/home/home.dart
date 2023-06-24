import 'package:flutter/material.dart';
import '../../api_services/api_service.dart';
import '../more_screen/more_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.png",
          height: 60,
          width: 220,
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            height: 10,
            width: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {},
              child: Stack(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Icon(
                      Icons.circle_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 6),
                    child: Icon(
                      Icons.call,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35, top: 8),
                    child: Text(
                      "ট্রীটমেন্ট হটলাইন",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoreScreen()));
              },
              child: const CircleAvatar(
                radius: 20,
                foregroundImage: AssetImage("assets/images/profile.png"),
              )),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText:
                            "নাম/কোড অথবা ডিপার্টমেন্ট দ্বারা ডাক্তার খুঁজুন",
                        hintStyle: TextStyle(fontSize: 14),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder()),
                  )),
              const SizedBox(
                height: 20,
              ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                              height: 205,
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("ভিভিও\nকন্সাল্টেশন",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("৭৮১ জন ডাক্তার এখন অনলাইনে")
                                  ],
                                ),
                              )),
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                              height: 95,
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("স্বাস্থ্যসেবা",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("পরামর্শ, হস্পিটাল কেয়ার এবং আরো")
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                              height: 150,
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("অর্ডার মেডিসিন",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("কয়েক ঘন্টার মধ্যে নির্ভেজাল ঔষধ পান")
                                  ],
                                ),
                              )),
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("ডায়গনস্টিক টেস্ট",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("বাড়ি থেকে ডায়গনস্টিক নমুনা সংগ্রহ")
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("বন্ধুকে রেফার করুন")
            ],
          ),
        ),
      ),
    );
  }
}
