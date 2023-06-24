import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/app_controller.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    TextEditingController nameController =
        TextEditingController(text:appController.userProfile.value!.name);
    TextEditingController phoneController =
        TextEditingController(text:appController.userProfile.value!.phone);
    TextEditingController emailController =
        TextEditingController(text: appController.userProfile.value!.email);
    TextEditingController genderController =
        TextEditingController(text: appController.userProfile.value!.gender);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(radius: 55, child: Icon(Icons.camera_alt)),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Phone',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'Gender',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7.0,
              ),
              SizedBox(
                height: 35,
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      prefixIcon: const Icon(Icons.circle_outlined),
                      hintText: 'Gender',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide()),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide())),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Update Profile")))
            ],
          ),
        ),
      ),
    );
  }
}
