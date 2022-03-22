import "package:flutter/material.dart";
import 'package:la_mita/pages/widgets/header.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  double headerheight = 250;
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

   moveToOTP(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.otpRoute);
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
                "WELCOME",
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
                          } else if (value.length <= 9) {
                            return "Mobile Number should be atleast 10 digits";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Material(  
                        color: MyTheme.orange3,
                        borderRadius: BorderRadius.circular(changeButton ? 70:30),
                         child: InkWell(
                        onTap: () => moveToOTP(context),
                        child: AnimatedContainer(duration: Duration(seconds: 1),
                        width: changeButton ? 50:150,
                        height: 50,
                        alignment: Alignment.center,
                        
                        child: changeButton ? 
                       Icon(
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
                                



                                
                      )
                      
                    /*  TextFormField(
                        decoration:
                      InputDecoration(
hintText: 'Enter OTP',
contentPadding:
const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
border: const OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(10.0)),
),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: MyTheme.grey, width: 2.0),
borderRadius: const BorderRadius.all(Radius.circular(10.0)),
),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: MyTheme.orange, width: 2.0),
borderRadius: const BorderRadius.all(Radius.circular(10.0)),
),)
                     
                       )*/ 
                  
                      ),
                       SizedBox(
                        height: 75.0,
                      ),

                       Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/disco.png",
                    fit: BoxFit.cover)
                  ],
                )
                      
                      
                        ) ]
                      )
                      ),
          ]
          )
          
          )
          
             ] )
    )
     ) );
            
  }
}
