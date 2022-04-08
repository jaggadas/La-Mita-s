import 'package:flutter/material.dart';
import 'package:la_mita_admin/services/Firebase.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Container(child: Center(child: TextButton(onPressed: (){FirebaseService().signOut(context);}, child: Text("Sign Out")),),),
      
    );
  }
}