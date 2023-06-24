
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import '../../api_services/api_service.dart';
import '../../controllers/app_controller.dart';
import '../../utils/login_utils.dart';
import '../sign_up/sign_up.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool status = true;
  bool isObscure = true;
  bool isChecked = false;
  String email = "";
  String pass = "";
  ApiService apiService = ApiService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Image.asset(
              "assets/images/logo.png",
              height: 60,
              width: 200,
            ),
            actions: [
              FlutterSwitch(
                width: 68.0,
                height: 32.0,
                activeText: "বাং",
                inactiveText: "En",
                valueFontSize: 12.0,
                toggleSize: 42.0,
                value: status,
                borderRadius: 30.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _loginFormKey,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Sign in to explore the features available for you",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Sign in",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              helperText: " ",
                              hintText: "Email",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 10, 0, 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              // else if (!RegExp(
                              //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              //     .hasMatch(email)) {
                              //   return 'Email is invalid';
                              // }
                              else {
                                return null;
                              }
                            },
                            onSaved: (String? newValue) {
                              email = newValue ?? '';
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Center(
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: isObscure,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              helperText: " ",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(13, 10, 0, 12),
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: Image.asset('assets/images/show.png')),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              //   else if (!RegExp(r'^().{8,}$').hasMatch(password)) {
                              //     return 'At least 8 char needed';
                              // //   }
                              else {
                                return null;
                              }
                            },
                            onSaved: (String? newValue) {
                              pass = newValue ?? '';
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  value: isChecked,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text('Forgot Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  if (_loginFormKey.currentState!.validate()) {
                                    _loginFormKey.currentState!.save();
                                    if (appController.usertype == "user") {
                                      await SignInUtility.performUserSignIn(
                                          context, email, pass);
                                    } else {
                                      await SignInUtility
                                          .performDoctorAgentSignIn(
                                              context, email, pass);
                                    }
                                  }

                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: const Center(child: Text('Login')),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpForm(),
                                ),
                              );
                            },
                            child: const Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
