import 'package:flutter/material.dart';

import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/screens/loging_Page.dart';
import 'package:flutter_application_11/screens/navigator_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
   SplashRoute();
   checkUser();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(width: double.infinity,
          child: Image.asset('assets/photo_2024-02-08_23-26-31.jpg',fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          ),
        ),
      ),

    );
    
  }
 void SplashRoute()async{
await Future.delayed(const Duration(seconds: 4));
Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  LoginPage(),));
  }
  Future <void> checkUser()async{
    final _sharedPrfs = await SharedPreferences.getInstance();
    final _userLogin =_sharedPrfs.getBool(SAVE_KEY);
  if(_userLogin==null|| _userLogin==false){
      LoginPage();

    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        // ignore: prefer_const_constructors
        return NavigatorHome();
      }));
    }  
    
  }
}