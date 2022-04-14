

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_mita_admin/utils/PaymentObject.dart';
import 'package:la_mita_admin/utils/routes.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/widgets/progress_dialog.dart';
import '../pages/widgets/themes.dart';
import '../pages/widgets/toast.dart';
import '../utils/FirebaseConstants.dart';
import 'package:intl/intl.dart';
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
      print("disco${email}disco");
    final loggedInUser=await auth.signInWithEmailAndPassword(email: email.trim(), password: password);
    if(loggedInUser!=null){
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }}
        catch(e){
      FlutterToastService().showToast('$e');
      pu.close();

        }
  }
  addPhoneNumber(String phone,BuildContext context)async{
    ProgressDialog pu=ProgressDialog(context: context);
    pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
    try{
    await firestore
        .collection(kNumber)
        .doc('QKLKZkSNh4tZcqdOgCQ0')
        .update({
      kNumber: FieldValue.arrayUnion([
        '+91$phone'
      ])

    });
    pu.close();}
        catch(e){
          FlutterToastService().showToast('$e');
          pu.close();
        }


  }

  addSite(String site,BuildContext context)async{
    ProgressDialog pu=ProgressDialog(context: context);
    pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
    try{
      await firestore
          .collection(kSites)
          .doc('EFlzXTaKAyhihMyeQzTI')
          .update({
        kSites: FieldValue.arrayUnion([
          site
        ])

      });
      pu.close();}
    catch(e){
      FlutterToastService().showToast('$e');
      pu.close();
    }


  }

  signOut(BuildContext context){
    auth.signOut();
    Navigator.popAndPushNamed(context, MyRoutes.loginRoute);
  }
  verifyPayment(int index,PaymentObject payObj,BuildContext context,String verified)async{
    ProgressDialog pu=ProgressDialog(context: context);
    pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
    try{
      DocumentSnapshot data = await firestore
          .collection(kVerifiedPayments)
          .doc(payObj.user_id)
          .get();
      print("disco${payObj.user_id}disco");
      var userData= await firestore.collection(kPaymentVerification).doc(payObj.user_id.trim()).get();
      var userFinalData=userData.get(kVerification);
      var userDataAtIndex=userFinalData[index];
      var mainString=userDataAtIndex[kPayment];

      if(data.exists){
        print('TestMyAss'+true.toString());
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(now);
        print(formattedDate);
        await firestore
            .collection(kVerifiedPayments)
            .doc(payObj.user_id)
            .update({
          kVerification: FieldValue.arrayUnion([
            {kPayment:mainString,kVerificationStatus:verified,kVerificationDate:formattedDate.toString()},

          ])
        });
        await firestore
            .collection(kPaymentVerification)
            .doc(payObj.user_id)
            .update({
          kVerification: FieldValue.arrayRemove([
            {kPayment:mainString}
          ])
        });
      }
      else{
        print('TestMyAss'+false.toString());
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(now);
        await firestore
            .collection(kVerifiedPayments)
            .doc(payObj.user_id)
            .set({
          kVerification: FieldValue.arrayUnion([
            {kPayment:mainString,kVerificationStatus:verified,kVerificationDate:formattedDate},

          ])

        });
        await firestore
            .collection(kPaymentVerification)
            .doc(payObj.user_id)
            .update({
          kVerification: FieldValue.arrayRemove([
            {kPayment:mainString}
          ])
        });
      }
      pu.close();
    }
    catch(e){
      pu.close();
      print(e);
      FlutterToastService().showToast('$e');
    }
  }
  printMessage(String msg) {
    debugPrint(msg);
  }
}