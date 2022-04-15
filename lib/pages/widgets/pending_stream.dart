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
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Material(
            elevation: 0,
            child: InkWell(
              child: Container(
                 padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                            
                                      Row(
                                        // mainAxisAlignment:
                                      //  MainAxisAlignment.spaceEvenly,
                                           children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8,),
                                      Text(
                                        paymentObj.user_name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                           ]
                                           ),
                                       
                                      // SizedBox(width: 80,),
                                       
                                      Row(
                                        children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                       SizedBox(width: 5,),
                                      Text(paymentObj.payment_amount,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white))
                                        ]),
                                      ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                          
             
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                        
                            children:[
                          Icon(Icons.mail,
                           color: Colors.white, 
                           size: 20,), 
                           SizedBox(width: 4,),
                          Text(paymentObj.email, 
                          style:
                           TextStyle(
                             fontSize: 15,
                                  color: Colors.white)),
                            ]),
                         Row(children: [
                             Icon(Icons.calendar_month, color: Colors.white, size: 20,), SizedBox(width: 4,),
                          Text(paymentObj.date, style: TextStyle(fontSize: 15, color: Colors.white))
                           ])   ],
                      ),
                      SizedBox(height:5,),
                       Row( 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[Row(children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8,),
                                      Text(paymentObj.phone_number,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white)),
                                                // SizedBox(width: 65,),
                            
                                            ]),   

                                            Row(
                                              children:[
                                                 Text('Site:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
 SizedBox(width: 4,),
                                      Text(paymentObj.site,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white))
                                      ]), 
               
                          ])
                     
                     
                     
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