import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_mita/pages/otp.dart';
import 'package:la_mita/pages/widgets/header.dart';
import 'package:la_mita/pages/widgets/progress_dialog.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../services/Firebase.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  double headerheight = 250;
  bool changeButton = false;
  String entered_phone='';



  final _formKey = GlobalKey<FormState>();

  moveToOTP(
      {required BuildContext context,
      required ConfirmationResult confirmationResult}) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));

      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return otp(
          confirmationResult: confirmationResult,
          phone: entered_phone,
        );
      }));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
                height: headerheight,
                child: HeaderWidget(
                  headerheight,
                  true,
                  "Welcome",
                )),
            SafeArea(
              child: Column(children: [
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
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      cursorColor: MyTheme.orange2,
                      decoration: kInputDecoration,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile Number can not be empty";
                        } else if (value.length <= 9) {
                          return "Mobile Number should be atleast 10 digits";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          entered_phone = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      color: MyTheme.orange3,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 70 : 30),
                      child: InkWell(
                        onTap: () async {
                          //TODO: add send OTP functionality
                          var userExists=await FirebaseService().verifyUserExistence(entered_phone);
                          if(userExists){
                            var temp =
                            await FirebaseService().sendOTP(entered_phone,context);
                            moveToOTP(context: context, confirmationResult: temp);
                          }else{
                            FlutterToastService().showToast('You are not authorized to use this app');
                          }

                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Generate OTP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75.0,
                    ),
                   
                  ]),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
