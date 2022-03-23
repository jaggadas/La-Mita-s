import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:la_mita/pages/widgets/progress_dialog.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../services/Firebase.dart';

class otp extends StatelessWidget {
  var confirmationResult;
  otp({this.confirmationResult});
  late String enteredOTP;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              
              SizedBox(
                height: 18,
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Image.asset(
                  'assets/images/disco.png',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 1,
              ),



              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PinInputTextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly],
              onChanged: (value){
                enteredOTP=value;
              },
             // showFieldAsBox: true,
              onSubmit: (String pin){
              //TODO: add on submit
              }, // end onSubmit
            ), // end PinEntryTextField()
          ), // end Padding()
        ),
      

SizedBox(
  height: 40,
),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{

                            await FirebaseService().authenticateMe(confirmationResult, enteredOTP,context);

                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(MyTheme.orange3),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),

              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(onPressed: (){Navigator.popAndPushNamed(context,MyRoutes.loginRoute);}, child: Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.orange3,
                ),
                textAlign: TextAlign.center,
              ),)
            ],
          ),
        ),
      ),
    );
  }}

