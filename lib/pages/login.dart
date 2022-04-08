import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/header.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/constrants.dart';


class loginPage extends StatefulWidget {
  const loginPage({ Key? key }) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
   double headerheight = 250;
    String entered_phone='';

  
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
                  "Admin Login",
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
                      cursorColor: MyTheme.orange4,
                      decoration: kInputDecoration.copyWith(
                        hintText: "Enter Email",
                        labelText: "Email",
                      ),
                      
                     // decoration: kInputDecoration,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                         // entered_phone = value;
                        });
                      },
                    ),

                    SizedBox(height: 30),

                     TextFormField(
                       cursorColor: MyTheme.orange4,
                        obscureText: true,
                      decoration: kInputDecoration.copyWith(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                     
                     // decoration: kInputDecoration,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                         // entered_phone = value;
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
                         // var userExists=await FirebaseService().verifyUserExistence(entered_phone);
                         // if(userExists){
                         //   var temp =
                           // await FirebaseService().sendOTP(entered_phone,context);
                         //   moveToOTP(context: context, confirmationResult: temp);
                        //  }else{
                          //  FlutterToastService().showToast('You are not authorized to use this app');
                        //  }

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
                                  "Login",
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

    