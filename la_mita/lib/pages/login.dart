import "package:flutter/material.dart";
import 'package:la_mita/pages/widgets/header.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  double headerheight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: headerheight,
              child: HeaderWidget(
                headerheight,
                true,
                Icons.home_filled,
              )),
          SafeArea(
              child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Mobile Number",
                          labelText: "Mobile Number",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number can not be empty";
                          } else if (value.length <= 10) {
                            return "Mobile Number should be atleast 10 digits";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.white,
                      )
                    ],
                  ))
            ],
          )),
        ])));
  }
}
