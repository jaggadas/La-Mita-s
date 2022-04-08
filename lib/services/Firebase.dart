

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_mita_admin/utils/routes.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/widgets/progress_dialog.dart';
import '../pages/widgets/themes.dart';
import '../pages/widgets/toast.dart';
import '../utils/FirebaseConstants.dart';
import '../utils/UserModel.dart';
class FirebaseService{
  FirebaseAuth auth=FirebaseAuth.instance;
  String phoneNumber = "";
  FirebaseFirestore firestore=FirebaseFirestore.instance;


  getAuthId(){
    return (auth.currentUser?.uid);
  }
  getInitialScreen(){
    User? currentUser=auth.currentUser;
    if(currentUser==null){
      return loginPage();
    }else{
      return Home();
    }
  }
  signIn(String email, String password,BuildContext context)async{
    ProgressDialog pu=ProgressDialog(context: context);
    pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
    try{
      print("$email ");
    final loggedInUser=await auth.signInWithEmailAndPassword(email: email, password: password);
    if(loggedInUser!=null){
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }}
        catch(e){
      FlutterToastService().showToast('$e');
      pu.close();

        }
  }
  verifyUserExistence(String phone)async{
    String entered_phone='+91$phone';
    try{
      bool numberExists=false;
      var userData =
      await firestore.collection(kNumber).doc('QKLKZkSNh4tZcqdOgCQ0').get();
      var listOfNumbers=userData.get(kNumber);
      for(String number in listOfNumbers){
        if (entered_phone==number){
          numberExists=true;
          break;
        }
      }
      return numberExists;}
    catch(e){
      print(e);
    }

  }

  signOut(BuildContext context){
    auth.signOut();
    Navigator.popAndPushNamed(context, MyRoutes.loginRoute);
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}