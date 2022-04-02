import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class myprofile extends StatefulWidget {
  const myprofile({Key? key}) : super(key: key);

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
    },
    backgroundColor: MyTheme.orange4,
    child: Icon( CupertinoIcons.pencil
    ,
    size: 35, color: Colors.white,  

    ),),
        backgroundColor: Colors.white,
        appBar: AppBar(
          
          title: 
          Text("My Profile"),
          
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: MyTheme.orange4,
          elevation: 0,

        ),
        body: Container(
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.only(left: 60, right: 60, top: 30),
              child: Column(children: [
                 Image.asset(
                    'assets/images/disco.png',
                  ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row()
                ),
                TextField( decoration: InputDecoration(  
                  labelText: "Name",
                 // hintText: "Sejal Kothari",
                  hintStyle: TextStyle(  
                    fontSize: 18,
                    color: Colors.grey,
                  ) 
                ),
              ),
              SizedBox(
                height: 40,
              ),
               TextField( decoration: InputDecoration(  
                  labelText: "Email ID",
                 // hintText: "Sejal Kothari",
                  hintStyle: TextStyle(  
                    fontSize: 18,
                    color: Colors.grey,
                  ) 
                ),
              ),
               SizedBox(
                height: 40,
              ),
               TextField( 
                  decoration: InputDecoration(  
                  labelText: "Site",
                 // hintText: "Sejal Kothari",
                  hintStyle: TextStyle(  
                    fontSize: 18,
                    color: Colors.grey,
                  ) 
                ),
              ),

           //   Icon( CupertinoIcons.pencil,
             // color: Colors.grey,
             // size: 30, ),
             //  Padding(padding: EdgeInsets.only(right: 18))
                
               
              ]
              ),
          ),
              
             
                
               
        ]
        )
        )
        );
  }
}
