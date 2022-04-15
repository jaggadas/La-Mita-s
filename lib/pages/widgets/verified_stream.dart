import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/PaymentObject.dart';
import 'package:la_mita_admin/utils/UserModel.dart';

import '../../services/Firebase.dart';
import '../../utils/FirebaseConstants.dart';
import '../payment_details.dart';

var firestore=FirebaseFirestore.instance;

class VerifiedStream extends StatefulWidget {
  VerifiedStream({required this.id}) {
    print('ID$id');
  }

  String id;
  @override
  State<VerifiedStream> createState() => _VerifiedStreamState();

}

class _VerifiedStreamState extends State<VerifiedStream> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<VerifiedPaymentElement> payments = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final paymentData = snapshot.data?.docs;

        for (var paymentL in paymentData!) {
          if(paymentL.id==widget.id){
            if(paymentL.exists){
              List payment = paymentL.get(kVerification);
              if (payment.isNotEmpty) {
                for (var paymentItem in payment) {
                  //final paymentName = paymentItem.keys.elementAt(0);
                  //final verificationStatus = paymentItem.keys.elementAt(1);
                  final Details = paymentItem[kPayment];
                  final status=paymentItem[kVerificationStatus];
                  final date=paymentItem[kVerificationDate];
                  PaymentObject paymentObj = PaymentObject.fromJson(
                      jsonDecode(Details));

                  payments.add(VerifiedPaymentElement(paymentObj: paymentObj,verificationStatus: status,verificationDate: date,));
                }
                payments=payments.reversed.toList();
                return SizedBox(
                  height: 600,
                  child: ListView(
                    children: payments,
                  ),
                );
              }
            }
          }

        }
        return Center(child: Text("No Payments"));
      },

      stream: firestore.collection(kVerifiedPayments).snapshots(),
    );
  }
}

class VerifiedPaymentElement extends StatelessWidget {
  const VerifiedPaymentElement({

    required this.paymentObj,
    required this.verificationStatus
    ,required this.verificationDate
  }) ;

  final PaymentObject paymentObj;
  final String verificationStatus;
  final String verificationDate;
//
  // {"date":"2022-04-20","payment_amount":"14234",
  // "payment_mode":"Cheque","payment_month":"October",
  // "payment_remarks":"234324","payment_type":"Security Deposit","payment_year":"2021",
  // "user_id":"l4NPCwcSaqQURmEDLbkeBg0OROy1","user_name":"jayakarthi"}
  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){ Navigator.push(context,MaterialPageRoute(builder: (context){
          return PaymentDetails(paymentObject: paymentObj,);
        }));},
        child: Container(
 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
  decoration: BoxDecoration(
      color: verificationStatus==kAccepted?Colors.green.shade400:Colors.red.shade400,
  borderRadius: BorderRadius.circular(10),),
        
          child: Column(
              children:[
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[
                   
                Row(children:[Text('Payment Date :'+paymentObj.date, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),SizedBox(height: 5,)]),
                Row(children:[ Text('Payment amount :'+paymentObj.payment_amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)]),
             ]),   Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:[
                Row(children:[Text('verified on :'+verificationDate, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),SizedBox(height: 5,)]),
                Row(children:[ Text('status :'+verificationStatus, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)]),
                ]),
              ]
          ),
        ),
      ),
    );
  }
}