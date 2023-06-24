import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllConsults extends StatefulWidget {
  const AllConsults({super.key});

  @override
  State<AllConsults> createState() => _AllConsultsState();
}

class _AllConsultsState extends State<AllConsults> {
  List<String> tabItems = ['Today Consults', 'Past Consults'];
  int currentIndex = 0;
  int appointments = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // DateTime now = DateTime.now();
  String month = DateFormat('MMMM').format(DateTime.now());
  String year = DateFormat('yyyy').format(DateTime.now());
  String day = DateFormat('d').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buttons(),
            const SizedBox(
              height: 20,
            ),
            tabBarItem(),
            const SizedBox(
              height: 40,
            ),
            Container(child: Text('Today $month $day, $year [$appointments]')),
            const SizedBox(
              height: 40,
            ),
            patientsList()
          ],
        ),
      ),
    );
  }

  Container patientsList() {
    return Container(
            child: Expanded(
                child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(-2, 2)),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Image.asset(
                              'assets/images/men1.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/messages.png'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 70,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Message'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Completed')
                              ],
                            ),
                            Text(
                              'John Roy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('09:30 AM - 10:00 AM')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(-2, 2)),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Image.asset(
                              'assets/images/lady1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/zoom.webp'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 70,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Video Call'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Completed')
                              ],
                            ),
                            Text(
                              'Virginia Bailey',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('09:30 AM - 10:00 AM')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(-2, 2)),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Image.asset(
                              'assets/images/men2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/call.jpg'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 70,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Voice Call'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Completed')
                              ],
                            ),
                            Text(
                              'Frank Muller',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('09:30 AM - 10:00 AM')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(-2, 2)),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Image.asset(
                              'assets/images/lady2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: -10,
                            bottom: -10,
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Image.asset('assets/images/messanger.webp'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 70,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Live Chat'),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Completed')
                              ],
                            ),
                            Text(
                              'Corolyn Goodwin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('09:30 AM - 10:00 AM')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            )),
          );
  }

  Container tabBarItem() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: index == 0
                      ? const EdgeInsets.only(right: 50)
                      : const EdgeInsets.only(right: 0),
                  child: Text(
                    tabItems[index],
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                currentIndex == index
                    ? Container(
                        alignment: Alignment.bottomLeft,
                        height: 2,
                        width: 60,
                        color: Colors.black,
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const InkWell(
                child: Icon(
                  Icons.search_outlined,
                  color: Colors.lightBlue,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue),
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const InkWell(
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.lightBlue,
                  size: 30,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
