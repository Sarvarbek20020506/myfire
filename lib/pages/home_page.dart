
import 'package:flutter/material.dart';
import 'package:myfire/services/auth_service.dart';

import '../moldes/post_model.dart';
class HomePage extends StatefulWidget {
  static final String id ="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = false;
  List <Post> items =[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(onPressed: (){
          AuthService.signOut(context);
          },
              icon: Icon(Icons.logout,color: Colors.red,))
        ],
        backgroundColor: Colors.blueGrey,
        title: Text('Home Page'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index){
              return itemOfPost(items[index]);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          print('warning post creating!!☺');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost (Post post){ 
    return Container();
  }

}
