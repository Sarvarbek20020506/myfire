import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfire/pages/home_page.dart';
import 'package:myfire/pages/login_page.dart';
import 'package:myfire/pages/signUpPage.dart';
import 'package:myfire/pages/splashPage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes:{
        HomePage.id : (context) => HomePage(),
        SplashPage.id : (context) => SplashPage(),
        LogInPage.id : (context) => LogInPage(),
        SignUpPage.id : (context) => SignUpPage(),
      },
    );
  }
}

