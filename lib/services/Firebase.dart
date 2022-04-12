import 'dart:convert';
import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_mita/utils/routes.dart';
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

 sendOTP(String phoneNumber,BuildContext context) async {
  ProgressDialog pd = ProgressDialog(context: context);
  pd.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  try{
  this.phoneNumber = phoneNumber;
  ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
   '+91 $phoneNumber',
  );
  printMessage("OTP Sent to +91 $phoneNumber");
  return confirmationResult;}
      catch(e){
   pd.close();
   FlutterToastService().showToast(e.toString());
      }
 }
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
 send()async{




 }
 sendPaymentForVerification(String date, String type, String month, String year,String mode,String amount,String remarks,String uid,BuildContext context)async{
  ProgressDialog pu=ProgressDialog(context: context);
  pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  try{
   DocumentSnapshot data = await firestore
       .collection(kPaymentVerification)
       .doc(auth.currentUser?.uid)
       .get();
   var userData= await firestore.collection(kUsers).doc(auth.currentUser?.uid).get();
   var userName=userData.get(kName);
   var userSite=userData.get(kSite);
   var userEmail=userData.get(kEmail);
   var userPhone=userData.get(kPhone);
   var mainString=jsonEncode( {kPaymentDate:date,kPaymentAmount:amount,kPaymentMode:mode,
    kPaymentMonth:month,kPaymentRemarks:remarks,kPaymentType:type,
    kPaymentYear:year,kUserId:'${auth.currentUser?.uid}'
    ,  kUserName:userName,kSite:userSite,kEmail:userEmail,kPhone:userPhone},
   );
   if(data.exists){
    print(true);

   await firestore
       .collection(kPaymentVerification)
       .doc(auth.currentUser?.uid)
       .update({
    kVerification: FieldValue.arrayUnion([
     {kPayment:mainString},

    ])

   });}
   else{

    await firestore
        .collection(kPaymentVerification)
        .doc(auth.currentUser?.uid)
        .set({
     kVerification: FieldValue.arrayUnion([
      {kPayment:mainString},

     ])

    });
   }
   pu.close();
  }
  catch(e){
   pu.close();
   FlutterToastService().showToast('$e');
  }
 }
 updateDetails(String username,String email,String site,BuildContext context)async{
  ProgressDialog pd=ProgressDialog(context: context);
  pd.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  try{
   await firestore.collection(kUsers).doc(auth.currentUser?.uid).update(
       {kName: username, kPhone: '${auth.currentUser?.phoneNumber}',kSite:site,kEmail:email});
  pd.close();
  }
  catch(e){
   pd.close();
   FlutterToastService().showToast('$e');
  }
 }

 getNewUserScreen(BuildContext context)async {
  var userData =await firestore.collection("users").doc(auth.currentUser?.uid).get();
  if (userData.exists){
    Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
  }else{
   Navigator.popAndPushNamed(context, MyRoutes.userdetailsRoute);
  }
 }
 uploadUserDetails(String username,String email,String site,BuildContext context)async{
  ProgressDialog pu=ProgressDialog(context: context);
  pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  try{
  await firestore.collection(kUsers).doc(auth.currentUser?.uid).set(
      {kName: username, kPhone: '${auth.currentUser?.phoneNumber}',kSite:site,kEmail:email});}
      catch(e){
   pu.close();
   FlutterToastService().showToast('$e');
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
 getUserDetails()async{
  var userData =
      await firestore.collection(kUsers).doc(auth.currentUser?.uid).get();

  return UserModel(
      phone: userData.get(kPhone),
      email: userData.get(kEmail),
      name: userData.get(kName),
      site:userData.get(kSite)
  );
 }
 getInitialSite()async{
  var userData =
  await firestore.collection(kSites).doc('EFlzXTaKAyhihMyeQzTI').get();
  print(userData.get(kSites)[0]);
  return userData.get(kSites)[0];
 }


 authenticateMe(ConfirmationResult confirmationResult, String otp,BuildContext context) async {
  ProgressDialog ps = ProgressDialog(context: context);
  ps.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  try {
   UserCredential userCredential = await confirmationResult.confirm(otp);
   userCredential.additionalUserInfo!.isNewUser
       ? printMessage("Successful Authentication")
       : printMessage("User already exists");
   getNewUserScreen(context);
  }catch(e){
   ps.close();
   print("hello");
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