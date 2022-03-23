import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_mita/utils/routes.dart';

import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/widgets/toast.dart';
class FirebaseService{
 FirebaseAuth auth=FirebaseAuth.instance;
 String phoneNumber = "";

 sendOTP(String phoneNumber) async {
  try{
  this.phoneNumber = phoneNumber;
  ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
   '+91 $phoneNumber',
  );
  printMessage("OTP Sent to +91 $phoneNumber");
  return confirmationResult;}
      catch(e){
   FlutterToastService().showToast(e.toString());
      }
 }
 getInitialScreen(){
  User? currentUser=auth.currentUser;
  if(currentUser==null){
   return loginPage();
  }else{
   return Home();
  }
 }
 authenticateMe(ConfirmationResult confirmationResult, String otp,BuildContext context) async {
  try {
   UserCredential userCredential = await confirmationResult.confirm(otp);
   userCredential.additionalUserInfo!.isNewUser
       ? printMessage("Successful Authentication")
       : printMessage("User already exists");
   Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
  }catch(e){
   FlutterToastService().showToast(e.toString());
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