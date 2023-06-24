import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({super.key});

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            backButton(context),
            const SizedBox(
              height: 40,
            ),
            labelName(),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Image.asset('assets/images/messages.png'),
                      title: const Text('Send Message'),
                      titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      subtitle: const Text(
                          'Send multiple messages/attachments. Get first response within 4 hours..\n\nStarting from \$45 per visit'),
                      trailing: CupertinoButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )),
                    ),
                    const SizedBox(height: 30,),
                    ListTile(
                      leading: Image.asset('assets/images/video.png'),
                      title: const Text('Video/Voice/Live Chat'),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                      subtitle: const Text(
                          '30 minutes call durations. Get first response within 30 minutes..\n\nStarting from \$45 per visit'),
                      trailing: CupertinoButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )),
                    ),
                    const SizedBox(height: 30,),
                    ListTile(
                      leading: Image.asset('assets/images/appointment.png'),
                      title: const Text('Online Appointment'),
                      titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                      subtitle: const Text(
                          'Check available time and schedule an online appointment with doctor and consult via call..\n\nStarting from \$45 per visit'),
                      trailing: CupertinoButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container labelName() {
    return Container(
      child: const Text(
        'Service Manager',
        style: TextStyle(
            color: Colors.black, fontSize: 35, fontWeight: FontWeight.normal),
      ),
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
