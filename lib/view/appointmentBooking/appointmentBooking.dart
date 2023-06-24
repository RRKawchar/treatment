import 'package:flutter/material.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({super.key});

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  bool swvalue = true;
  List<String> workingDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(context),
              const SizedBox(
                height: 30,
              ),
              titleAppointment(),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Service Price',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: '\$45',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: '/30 mins')
                            ]))
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.edit,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consulted',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '234',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' times')
                        ]))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Working Day and Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Day',
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: workingDays.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(workingDays[index]),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Apply from ',
                            ),
                            TextSpan(
                              text: '01/01/2020',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' to '),
                            TextSpan(
                                text: '20/01/2020',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: '\nIncluded Holidays')
                          ])),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Time',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: '\n08:00 AM - 12:00 PM',
                            ),
                            TextSpan(text: '\n02:00PM - 21:00 PM')
                          ])),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  'Check available time and schedule online appointment with doctor and consult via call',
                                  maxLines: null,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row titleAppointment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Online Appointment',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: swvalue,
          onChanged: (value) {
            swvalue = !swvalue;
            setState(() {});
          },
          activeColor: Colors.green,
        )
      ],
    );
  }

  Container backButton(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
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
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
