import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  int indexNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.withOpacity(0.2),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: indexNum,
        onTap: (index) {
          indexNum = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: '')
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                doctorBanner(),
                const SizedBox(
                  height: 20,
                ),
                searchBar(),
                const SizedBox(
                  height: 20,
                ),
                taskBar(),
                const SizedBox(
                  height: 25,
                ),
                tasksList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container tasksList() {
    return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(-2, 2))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/schedule.png',
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Schedule',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(-2, 2))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/clock.png',
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Consult History',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(-2, 2))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/team.png',
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Patient Management',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(-2, 2))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/chat.png',
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Schedule',
                                  style: TextStyle(color: Colors.lightBlue),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
  }

  Container taskBar() {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tasks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextSpan(
                        text: ' for today',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('5 of 9 completed')
              ],
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 2,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: 5 / 9,
                    color: Colors.green[400],
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  '5',
                  style: TextStyle(
                      color: Colors.green[400],
                      decoration: TextDecoration.underline,
                      fontSize: 40,
                      decorationStyle: TextDecorationStyle.solid),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: const TextField(
        cursorColor: Colors.grey,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
          hintText: 'Search patient, health issue....',
          hintStyle: TextStyle(fontStyle: FontStyle.italic),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Container doctorBanner() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.asset('assets/images/doc.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi Dr,',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('How\'re your today?'),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.2))
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.red,
                ),
              ),
              const Positioned(
                top: -5,
                right: -5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
