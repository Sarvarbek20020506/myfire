
import 'package:flutter/material.dart';
import 'package:myfire/services/auth_service.dart';
class HomePage extends StatefulWidget {
  static final String id ="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Home Page'),
      ),
      body: GestureDetector(
        onTap: (){
          AuthService.signOut(context);
        },
        child:Center(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: Text('LogOut',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
