import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/googleFormPage.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
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
        payments=payments.reversed.toList();

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
     return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Material(
            elevation: 0,
            child: InkWell(
              child: Container(
                 padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                    colors: [MyTheme.orange4, MyTheme.orange2],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0, 1.0],
                  ),
                      borderRadius: BorderRadius.circular(20),
                      color: MyTheme.orange2),
                  child: Column(
               children: [
                      Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Text(paymentObj.user_name, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold), ),
                          Text(paymentObj.payment_amount, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))
            
                        ],
                      ),
                       SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          Text(paymentObj.email, style: TextStyle(fontSize: 15, color: Colors.white)),
                         Icon(Icons.calendar_month, color: Colors.white, size: 20,),
                          Text(paymentObj.date, style: TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                      SizedBox(height: 15,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                   
                          Text(paymentObj.phone_number, style: TextStyle(fontSize: 15, color: Colors.white)),
                          Text(paymentObj.site, style: TextStyle(fontSize: 15, color: Colors.white))
                        ],
                      ),
                    ], 
                 )
                 ),
                 onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) {
          return GoogleFormPage(payObj: paymentObj,index: index,);
        }));},
            ),
               

   )
    
      
     ) ); 
                
    /*  child: GestureDetector(
        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) {
          return GoogleFormPage(payObj: paymentObj,index: index,);
        }));},
        child: Column(
            children:[
              Row(children:[
                Text(paymentObj.date),
                
                SizedBox(width: 5,),
                
                Text(
                  paymentObj.payment_amount)]),
              Row(children:[Text(paymentObj.phone_number),SizedBox(width: 5,),Text(paymentObj.user_name),]),
              Row(children:[Text(paymentObj.site),SizedBox(width: 5,),Text(paymentObj.email),]),


            ]
        ),
      ),
    ); */
  }
}