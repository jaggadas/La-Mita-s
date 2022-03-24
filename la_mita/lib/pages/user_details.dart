import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';

class userdetails extends StatefulWidget {
  const userdetails({ Key? key }) : super(key: key);

  @override
  State<userdetails> createState() => _userdetailsState();
}

class _userdetailsState extends State<userdetails> {


  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return 
          Container(
           
                    child: Column(
              children: [
              //  Padding(padding: EdgeInsets.only(left: 20.0)),
                Image.asset(
                  "assets/images/disco.png",
                 // fit: BoxFit.cover,
                  //height: 150,
                ),
               ] ),
                 
                  
             ) ;
             
             
             
          
      
         
         
         
  }
}