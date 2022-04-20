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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 3,),
                          Text(paymentObject!.user_name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        ],),
                      SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 3,),
                          Text(paymentObject!.phone_number, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        ],),
                      SizedBox(height: 12,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 3,),
                          Text(paymentObject!.email, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        ],),

                      SizedBox(height: 50,),
                      Row(children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text('Date of Payment: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text(paymentObject!.date ,style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),),],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text('Payment Month: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                        Text(paymentObject!.payment_month, style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,)),],),
                      SizedBox(height: 20,),
                      Row(children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text('Payment Year: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),

                        Text(paymentObject!.payment_year, style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,)),],),
                      SizedBox(height: 50,),
                      Row( children:[
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text('Amount: Rs ', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
                        Text(paymentObject!.payment_amount, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,)),],),

                        SizedBox(height: 15,),
                        Row(children: [
                          Icon(
                            Icons.money,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text('Type: ', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),

                          Text(paymentObject!.payment_type, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,)),],),
                      SizedBox(height: 50,),
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mode,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text('Payment Mode: ', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold,),),
                          Text(paymentObject!.payment_mode, style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,)),],),
                      SizedBox(height: 20,),
                      Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house,
                            color: Colors.black,
                            size: 20,
                          ),
                          Text('Payment Remarks: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                          Text(paymentObject!.payment_remarks, style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,)),],),

                    ],),
                ]) )
          ] )
          ),
        )
    );
  }
}
