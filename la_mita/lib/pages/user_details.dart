import 'package:flutter/material.dart';

import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';

class userdetails extends StatefulWidget {
  const userdetails({Key? key}) : super(key: key);

  @override
  State<userdetails> createState() => _userdetailsState();
}

class _userdetailsState extends State<userdetails> {
bool changeButton = false;

   final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) { 
    // Size size = MediaQuery.of(context).size;
    return Material(
         child: SingleChildScrollView(
            child: Form(
          key: _formKey,
//TODO: add image
            child: Column(children: [
      //  Padding(padding: EdgeInsets.only(left: 20.0)),
      Image.asset(
        'assets/images/disco.png',
        fit: BoxFit.cover,
        height: 150,
      ),
      SizedBox(
        height: 55,
      ),
      Column(
        children: [
          Text(
            'Registration',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        height: 30.0,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 55.0),
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Name",
              labelText: "Username",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Name can't be empty";
              }
              return null;
            },
             onChanged: (value) {
                       
                        setState(() {});
                      },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Email ID",
              labelText: "Email ID",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email ID can't be empty";
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Site",
              labelText: "Site",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Site can't be empty";
              }
              return null;
            },
          ),

          SizedBox(height: 40,
          ),

          Material(
             color: MyTheme.orange2,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 30),
                          child: InkWell(
                            onTap: () => 
                    Navigator.pushNamed(context, MyRoutes.homeRoute),
                            //moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 50,
          
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: MyTheme.orange,
                                    )
                                  : Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                              // decoration: BoxDecoration(
                              // color: MyTheme.darkgreen,
                              // borderRadius: BorderRadius.circular(8),
                              //  )
                            ),
                          )

          )
        ]),
      ),
    ]))));
  }
}
