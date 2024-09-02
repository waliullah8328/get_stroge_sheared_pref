import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_stroge_sheared_pref/home_screen.dart';
import 'package:get_stroge_sheared_pref/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();
  final password = TextEditingController();

  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
          centerTitle: true,
        ),
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("Enter your User name & password"),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Email";
                      }
                    },
                    decoration: const InputDecoration(
                      // hintText: "Enter email",
                      labelText: "Enter user name",
                      border: InputBorder.none,

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                    },
                    decoration: InputDecoration(
                      // hintText: "Enter email",
                      labelText: "Enter Password",
                      border: InputBorder.none,

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: Colors.blue)),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 6, backgroundColor: Colors.green),
                          onPressed: () async {
                            // Get.to(()=>const HomeScreen());


                            //storage.write("login", true);
                           // storage.write("username", userName.text);
                            //storage.write("password", password.text);
                            var  shearedPref = await SharedPreferences.getInstance();
                            shearedPref.setBool(SpashScreenState.LOGINKEY, true);

                            Get.offAll(()=>const AccountScreen());
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 26),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get.to(()=>const SignUpScreen());
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "Don't have account? "),
                      TextSpan(
                          text: "SingUp Now",
                          style: TextStyle(color: Colors.blue)),
                    ])),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
