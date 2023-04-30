 import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myfire/pages/home_page.dart';
import 'package:myfire/pages/login_page.dart';
import 'package:myfire/pages/signUpPage.dart';
import 'package:myfire/services/auth_service.dart';
 class SplashPage extends StatefulWidget {
   static  final  String id = "splash_page";
   const SplashPage({Key? key}) : super(key: key);

   @override
   State<SplashPage> createState() => _SplashPageState();
 }

 class _SplashPageState extends State<SplashPage> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimer();
  }
   void initTimer(){
     Timer(Duration(seconds: 2),_callNextPage);
   }

   _callNextPage(){
     if(AuthService.isLoggedIn()){
       Navigator.pushReplacementNamed(context, HomePage.id);
     }else{
     Navigator.pushReplacementNamed(context, SignUpPage.id);}
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       body: Column(
         children: [
           Expanded(child: Container(
             child: Center(
                   child: Text('This is White :)',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36)),
           ),
            ),),
           const Text("All informations security!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
           SizedBox(height: 20,),
         ],
       ),
     );
   }
 }


