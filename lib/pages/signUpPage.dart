import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfire/pages/home_page.dart';
import 'package:myfire/services/auth_service.dart';

import 'login_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static final String id ="signup_page";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var fullnamecontroller = TextEditingController();
  var emailController =  TextEditingController();
  var passwordController = TextEditingController();
  var cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  void  _doSignUp(){

     String fullname = emailController.text.trim();
     String email = emailController.text.trim();
     String password = emailController.text.trim();
     String cpassword = emailController.text.trim();

     void responseSignUp(User firebaseUser){
       print("work");
       Navigator.pushReplacementNamed(context, HomePage.id);
     }

     if(fullname.isEmpty || email.isEmpty || password.isEmpty || cpassword.isEmpty) return;
     if(password != cpassword) return;


      AuthService.signUpUser(fullname, email, password).then((value) => {
        responseSignUp(value!),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text("Up",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 55,),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54.withOpacity(0.3),
                  ),
                  child:  TextField(
                    controller: fullnamecontroller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline,color: Colors.white,size: 18,),
                      hintText: 'fullname',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    cursorHeight: 20,
                  ),
                ),
                //Email
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
                  child: TextField(
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
                //confirmPassword
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54.withOpacity(0.3),
                  ),
                  child: TextField(
                    controller: cpasswordController,
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
                    _doSignUp();
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
                    child:Text("Sign Up",
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
                    Text("Already have account",style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, LogInPage.id);
                      },
                      child: Text("Sign In",style: TextStyle(
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
