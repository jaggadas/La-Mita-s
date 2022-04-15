import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/PaymentObject.dart';
class PaymentDetails extends StatelessWidget {
  PaymentDetails({this.paymentObject});
  PaymentObject? paymentObject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('payment details'), backgroundColor: MyTheme.orange4,),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(child: 
        
        Column(children: [
            Container( padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: MyTheme.orange4,
                          width: 2.0
                        ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
          
        child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                   Text('Date of Payment: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(paymentObject!.date ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),],),
         Row(children: [
           Text('Payment Remarks: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          Text(paymentObject!.payment_remarks, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
           Row(children: [
              Text('Payment Amount: Rs ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          Text(paymentObject!.payment_amount, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
           Row(children: [
              Text('Payment Mode: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          Text(paymentObject!.payment_mode, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
           Row(children: [
              Text('Payment Year: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
      
          Text(paymentObject!.payment_year, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
           Row(children: [
              Text('Payment Month: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          Text(paymentObject!.payment_month, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
           Row(children: [
              Text('Payment Type: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
      
          Text(paymentObject!.payment_type, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,)),],),
        ],),
        ]) )
         ] )
          ),
      )
    );
  }
}
