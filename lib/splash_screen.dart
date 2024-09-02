import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_stroge_sheared_pref/home_screen.dart';
import 'package:get_stroge_sheared_pref/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => SpashScreenState();
}


class SpashScreenState extends State<SpashScreen> {
  static const String LOGINKEY = "Login";
  //final storage = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: const Text("Splash Screen")),
      ),
    );
  }

  Future<void> gotoNextScreen() async {
    //storage.writeIfNull("login", false);
    var shearedPref = await SharedPreferences.getInstance();
    var isLogin = shearedPref.getBool(LOGINKEY);


    Timer(const Duration(seconds: 3), () {

    if(isLogin != null){
      if(isLogin){
        Get.offAll(()=> const AccountScreen());
      }
      else{
        Get.offAll(()=> const LoginScreen());
      }
    }
    else{
      Get.offAll(()=> const LoginScreen());

    }


    });

  }
}
