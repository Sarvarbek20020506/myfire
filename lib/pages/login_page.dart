import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfire/pages/home_page.dart';
import 'package:myfire/pages/signUpPage.dart';
import 'package:myfire/services/auth_service.dart';

class LogInPage extends StatefulWidget {
  static final String id ="login_page";

  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final emailController =  TextEditingController();
    final passwordController = TextEditingController();


    _doSignIn(){
      String email = emailController.text.trim();
      String password = emailController.text.trim();

      void responseSignIn (value){
        Navigator.pushReplacementNamed(context, HomePage.id);
      }

      if(email.isEmpty || password.isEmpty) return;
      AuthService.signInUser(email, password).then((value) => {
        responseSignIn(value!),
      });


    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //WELCOME BACK
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text("Back",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
            SizedBox(height: 40,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Email
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54.withOpacity(0.3),
                  ),
                  child:  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail_outline_sharp,color: Colors.white,size: 18,),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    cursorHeight: 20,
                  ),
                ),
                //Password
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54.withOpacity(0.3),
                  ),
                  child:  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline,color: Colors.white,size: 18,),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    cursorHeight: 20,
                  ),
                ),
                //LogIn button
                GestureDetector(
                  onTap: (){
                    _doSignIn();
                  },
                  child:  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.all(10),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    child:Text("Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Don't have an accout?",style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, SignUpPage.id);
                      },
                      child: Text("SignUp",style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
