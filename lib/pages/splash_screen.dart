import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({ Key? key }) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(colors: [Theme.of(context).primaryColor,Theme.of(context).accentColor],
        begin: const FractionalOffset(0, 0) ,
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
         )
      ),

  
    );
    
    
  }
}