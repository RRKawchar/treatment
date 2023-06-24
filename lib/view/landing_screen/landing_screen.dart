import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treatment/view/landing_screen/widgets/custom_painter.dart';
import '../../controllers/api_controller.dart';
import '../../controllers/app_controller.dart';
import '../login/login_screen.dart';



class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

 final AppController appController = Get.find();
 final ApiController apiController = Get.find();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(end: Alignment.bottomCenter, colors: [
          Colors.deepPurple,
          Colors.white,
        ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              children: [
                Center(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 200),
                        child: Image.asset(
                          "assets/images/treatment_logo.png",
                          width: 200,
                        ))),
                const Center(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: UpsideDownTriangleWidget())),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  appController.setUsertype("user");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             const LoginScreen()));


                                },
                                child: const CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        "assets/images/group-icon.png"))),
                            const Text(
                              "User",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  appController.setUsertype("agent");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: const CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage("assets/images/agent.png"))),
                            const Text(
                              "Agent",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              appController.setUsertype("doctor");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage("assets/images/doctor-icon.png"),
                            )),
                        const Text(
                          "Doctor",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tap on the icons to navigate",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
