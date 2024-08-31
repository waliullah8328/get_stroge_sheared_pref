import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_stroge_sheared_pref/home_screen.dart';
import 'package:get_stroge_sheared_pref/login_screen.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}


class _SpashScreenState extends State<SpashScreen> {
  final storage = GetStorage();
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

  void gotoNextScreen() {
    storage.writeIfNull("login", false);


    Timer(const Duration(seconds: 3), () {

      storage.read("login")?Get.offAll(()=>const AccountScreen()): Get.offAll(()=>const LoginScreen());


    });

  }
}
