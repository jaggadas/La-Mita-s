import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/payment_details_page.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/PaymentObject.dart';
import 'package:la_mita/utils/UserModel.dart';

import '../../services/Firebase.dart';
import '../../utils/FirebaseConstants.dart';
var firestore=FirebaseFirestore.instance;

class PaymentVerificationStream extends StatefulWidget {
  @override
  State<PaymentVerificationStream> createState() => _PaymentVerificationStreamState();

}

class _PaymentVerificationStreamState extends State<PaymentVerificationStream> {

  String id=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<PaymentElement> payments = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final paymentData = snapshot.data?.docs;

        for (var paymentL in paymentData!) {
          if(paymentL.id==id){
            if(paymentL.exists){
          List payment = paymentL.get(kVerification);
          if (payment.isNotEmpty) {
            for (var paymentItem in payment) {
              final paymentName = paymentItem.keys.elementAt(0);
              final Details = paymentItem[paymentName];
              PaymentObject paymentObj = PaymentObject.fromJson(
                  jsonDecode(Details));
              payments.add(PaymentElement(paymentObj: paymentObj));
            }
            payments=payments.reversed.toList();
            return ListView(

              children: payments,
            );
          }
          }
          }
          }
        return Expanded(child: Center(child: Text("No Payments")));
        },

      stream: firestore.collection(kPaymentVerification).snapshots(),
    );
  }
}

class PaymentElement extends StatelessWidget {
  const PaymentElement({
    Key? key,
    required this.paymentObj,
  }) : super(key: key);

  final PaymentObject paymentObj;
//
  // {"date":"2022-04-20","payment_amount":"14234",
  // "payment_mode":"Cheque","payment_month":"October",
  // "payment_remarks":"234324","payment_type":"Security Deposit","payment_year":"2021",
  // "user_id":"l4NPCwcSaqQURmEDLbkeBg0OROy1","user_name":"jayakarthi"}
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
    child: GestureDetector(
      onTap:(){ Navigator.push(context,MaterialPageRoute(builder: (context){
        return PaymentDetails(paymentObject: paymentObj,);
      }));},
      child: Container(color: Colors.grey,
        child: Column(
          children:[
          Row(children:[Text('payment Date'+paymentObj.date),SizedBox(width: 5,),Text('payment Amount'+paymentObj.payment_amount)]),

          ]
        ),
      ),
    ),
    );
  }
}