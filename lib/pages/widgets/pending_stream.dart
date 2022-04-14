import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/googleFormPage.dart';
import 'package:la_mita_admin/utils/routes.dart';


import '../../services/Firebase.dart';
import '../../utils/FirebaseConstants.dart';
import '../../utils/PaymentObject.dart';
var firestore=FirebaseFirestore.instance;

class PaymentVerificationStream extends StatefulWidget {
  @override
  State<PaymentVerificationStream> createState() => _PaymentVerificationStreamState();

}

class _PaymentVerificationStreamState extends State<PaymentVerificationStream> {


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
        print(paymentData?.length);
        if(paymentData?.length!=0){
        for (var paymentL in paymentData!) {
          List payment = paymentL.get(kVerification);
          if (payment.isNotEmpty) {
            var index=0;
            for (var paymentItem in payment) {
              final paymentName = paymentItem.keys.elementAt(0);
              final Details = paymentItem[paymentName];
              PaymentObject paymentObj= PaymentObject.fromJson(jsonDecode(Details));
              payments.add(PaymentElement(paymentObj: paymentObj,index: index,));
              index++;
            }
          }
        }
        return ListView(
          children: payments,
        );}
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
    required this.index
  }) : super(key: key);

  final PaymentObject paymentObj;
  final int index;
  // {"date":"2022-04-14","payment_amount":"3000","payment_mode":"Cash","payment_month":"January",
  // "payment_remarks":"rent","payment_type":"Token Amount","payment_year":"2021","user_id":"l4NPCwcSaqQURmEDLbkeBg0OROy1",
  // "user_name":"jayakarthi","site":"BKC","email":"jaggadas123@gmail.com","phone_number":"+911111111111"}
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      child: GestureDetector(
        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) {
          return GoogleFormPage(payObj: paymentObj,index: index,);
        }));},
        child: Column(
            children:[
              Row(children:[Text(paymentObj.date),SizedBox(width: 5,),Text(paymentObj.payment_amount)]),
              Row(children:[Text(paymentObj.phone_number),SizedBox(width: 5,),Text(paymentObj.user_name),]),
              Row(children:[Text(paymentObj.site),SizedBox(width: 5,),Text(paymentObj.email),]),


            ]
        ),
      ),
    );
  }
}