import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/DropDownWidgetStream.dart';

import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:la_mita/utils/routes.dart';

import '../utils/FirebaseConstants.dart';

class userdetails extends StatefulWidget {
  const userdetails({Key? key}) : super(key: key);

  @override
  State<userdetails> createState() => _userdetailsState();
}
  late String selected_site;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  class _userdetailsState extends State<userdetails> {
  bool changeButton = false;
  String entered_email='';
  String entered_name='';
  validateForm(){

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(entered_email);
    if(entered_name==''&&entered_email==''&&!emailValid){
      FlutterToastService().showToast('Please enter correct credentials');
      return false;
    }
    else if(entered_name==''&&entered_email==''){
      FlutterToastService().showToast('Please enter correct credentials2');
      return false;
    }
    else if(entered_email==''||!emailValid){
      FlutterToastService().showToast('Please enter correct email');
      return false;
    }
    else if(entered_name==''){
      FlutterToastService().showToast('Please enter correct name');
      return false;
    }
    else{
      return true;
    }

  }

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
            cursorColor: MyTheme.orange2,
            decoration:  kInputDecoration.copyWith(hintText: "Enter Name",labelText: "Username"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Name can't be empty";
              }
              return null;
            },
             onChanged: (value) {
                       
                      entered_name=value;
                      },
          ),
          SizedBox(height: 30),
          TextFormField(
            cursorColor: MyTheme.orange2,
            decoration: kInputDecoration.copyWith(hintText: "Enter Email ID",labelText: "Email ID"),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
                entered_email=value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Email ID can't be empty";
              }
              return null;
            },
          ),
          SizedBox(height: 30),
         SiteStream(enabled: true,value: '',),


          SizedBox(height: 40,
          ),

          Material(
             color: MyTheme.orange2,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 30),
                          child: InkWell(
                            onTap: () async {
                              if(validateForm()){await FirebaseService().uploadUserDetails(entered_name, entered_email, SiteStream().getCurrentSite(),context);
                              Navigator.pushNamed(context, MyRoutes.homeRoute);}

                    },
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
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),

                            ),
                          )

          )
        ]),
      ),
    ]))));
  }

}


