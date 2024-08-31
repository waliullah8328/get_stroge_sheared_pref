import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_stroge_sheared_pref/login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AccountScreen> {
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Screen"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
             Text("User Name: ${storage.read("username")}",style: const TextStyle(fontSize: 21),),
             Text("User Password: ${storage.read("password")}",style: const TextStyle(fontSize: 21),),
            const SizedBox(height: 20,),

            OutlinedButton(onPressed: (){

              storage.write("login", false);
              storage.remove("username");
              storage.remove("password");
              Get.offAll(()=>const LoginScreen());
            }, child: const Text("Logout",style: TextStyle(fontSize: 21),)),
          ],
        ),
      ),
    );
  }
}
