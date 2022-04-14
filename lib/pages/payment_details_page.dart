import 'package:flutter/material.dart';
import 'package:la_mita/utils/PaymentObject.dart';
class PaymentDetails extends StatelessWidget {
 PaymentDetails({this.paymentObject});
  PaymentObject? paymentObject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('payment details'),),
    body: Column(children: [
      Text(paymentObject!.date),
      Text(paymentObject!.payment_remarks),
      Text(paymentObject!.payment_amount),
      Text(paymentObject!.payment_mode),

      Text(paymentObject!.payment_year),
      Text(paymentObject!.payment_month),

      Text(paymentObject!.payment_type),
    ],),
    );
  }
}
