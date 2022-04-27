import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_mita/pages/payments.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/paymentDetailsModel.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:la_mita/UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:url_launcher/url_launcher.dart';


class Payment extends StatelessWidget {
  PaymentDetailsModel? paymentDetails;
  Payment({this.paymentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.orange4,
        title: Text('Payment'),
      ),
      body: Mypaymentform(paymentDetails:paymentDetails,),
    );
  }
}


class Mypaymentform extends StatefulWidget {
  PaymentDetailsModel? paymentDetails;
  Mypaymentform({this.paymentDetails}){
    print(paymentDetails!.image);
  }

  @override
  State<Mypaymentform> createState() => _MypaymentformState();
}

class _MypaymentformState extends State<Mypaymentform> {
  var _result;
  var _result1;
  var _result2;

  String paymentType='';
  String paymentMonth='January';
  String year='';
  String paymentMode='';
  String paymentAmount='';
  String webAmount='';
  String paymentRemarks='';
  String authId=FirebaseService().getAuthId().toString();
  var amountController=TextEditingController();
  var remarksController=TextEditingController();
  void _launchURL() async {
    String upiId='7620780585-1@okbizaxis';
    String merchantCode='BCR2DN6TYXE2ZMCY';
    String name='LaMitas';
    String amount='1';
    String transactionId='12345678';
    String transactionName='RentPayment';
    //String _url='upi://pay?pa=$upiId&pn=$upiId&mc=$merchantCode&tr=$transactionId&tn=$transactionName&am=$amount&cu=INR';
    //String _url='upi://pay?pa=7620780585-1@okbizaxis&pn=7620780585-1@okbizaxis&mid=BCR2DN6TYXE2ZMCY&mc=BCR2DN6TYXE2ZMCY&tr=12345678&tn=rent&am=1.00&cu=INR';
    // String _url='upi://pay?pa=newdeoelectronics@indianbk&pn=newdeoelectronics@indianbk&tn=$transactionName&am=$amount&cu=INR';
    String _url='upi://pay?pa=9334188450@paytm&pn=9334188450@paytm&mc=&tr=12345&tn=$transactionName&am=$amount&cu=INR';
    print(_url);
    var result = await launch(_url);
    debugPrint(result.toString());
    if (result ==true) {
      print("Done");
    } else if (result ==false){
      print("Fail");

    }
  }
  getPlatform(){
    if(kIsWeb && (defaultTargetPlatform == TargetPlatform.android)){
      return 'Android';
    } else if(kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS)){
      return 'iOS';
    }   else{
      return 'Desktop';
    }
  }


  bool changeButton = true;
  String dropdownValue = 'January';
  validateForm(){

    if(paymentType==''){
      FlutterToastService().showToast('Please Enter Valid Payment Type');
      return false;}
    else if(paymentMonth==''){
      FlutterToastService().showToast('Please Enter Valid Payment Month');
      return false;}
    else if(year==''){
      FlutterToastService().showToast('Please Enter Valid Payment year');
      return false;}
    else if(paymentMode==''){
      FlutterToastService().showToast('Please Enter Valid Payment Mode');
      return false;}
    else if(paymentRemarks==''){
      FlutterToastService().showToast('Please Enter Valid Payment Remarks');
      return false;}
    else if(paymentAmount==''){
      FlutterToastService().showToast('Please Enter Valid Payment Amount');
      return false;}
    else{return true;}
  }
  resetForm(){
    setState(() {
      _result='';
      _result1='';
      _result2='';
      amountController.text='';
      remarksController.text='';

    });

  }


  String? value;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            // ListTile(
            // title:
            const Text('Payment Type', style: TextStyle(fontSize: 22)),

            RadioListTile(
                title: const Text('Rent'),
                value: 'Rent',
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                    paymentType=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('Security Deposit'),
                value: 'Security Deposit',
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                    paymentType=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('Token Amount'),
                value: 'Token Amount',
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                    paymentType=value.toString();
                  });
                }),

            SizedBox(
              height: 40,
            ),
            const Text('Payment for Month', style: TextStyle(fontSize: 22)),

            Container(
              child: Container(
                width: 450,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    //isExpanded: true,

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        paymentMonth=newValue.toString();
                      });
                    },
                    items: <String>[
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            const Text('Year', style: TextStyle(fontSize: 22)),
            RadioListTile(
                title: const Text('2022'),
                value: '2022',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('2023'),
                value: '2023',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('2024'),
                value: '2024',

                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),
            RadioListTile(
                title: const Text('2025'),
                value: '2025',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),
            RadioListTile(
                title: const Text('2026'),
                value: '2026',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),

            SizedBox(
              height: 40,
            ),

            const Text('Mode of Payment', style: TextStyle(fontSize: 22)),
            RadioListTile(
                title: const Text('Cash'),
                value: 'Cash',
                groupValue: _result2,
                onChanged: (value) {
                  setState(() {
                    _result2 = value;
                    paymentMode=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('Cheque'),
                value: 'Cheque',
                groupValue: _result2,
                onChanged: (value) {
                  setState(() {
                    _result2 = value;
                    paymentMode=value.toString();
                  });
                }),
            RadioListTile(
                title: const Text('UPI'),
                value: 'UPI',
                groupValue: _result2,
                onChanged: (value) {
                  setState(() {
                    _result2 = value;
                    paymentMode=value.toString();
                  });
                }),


                RadioListTile(
                    title: const Text('Netbanking'),
                    value:'Netbanking',
                    groupValue: _result2,
                    onChanged: (value) {
                      setState(() {
                        _result2 = value;
                        paymentMode=value.toString();
                      });
                    }),
                RadioListTile(
                    title: const Text('Security Deposit Use up'),
                    value:'Security Deposit Use up',
                    groupValue: _result2,
                    onChanged: (value) {
                      setState(() {
                        _result2 = value;
                        paymentMode=value.toString();
                      });
                    }),

            SizedBox(height: 40),

            TextFormField(
              cursorColor: MyTheme.orange2,
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: kInputDecoration.copyWith(
                hintText: "Enter Amount",

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),

                //icon: const Icon(Icons.calendar_month),
                iconColor: Colors.black,

                labelText: "Amount",
              ),
              onChanged: (value){
                setState(() {
                  paymentAmount=value;

                  webAmount=value+'00';

                });

              },
            ),

            SizedBox(height: 40),

            TextFormField(
              controller: remarksController,
              cursorColor: MyTheme.orange2,
              decoration: kInputDecoration.copyWith(
                hintText: "Enter Remarks",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                //icon: const Icon(Icons.calendar_month),
                iconColor: Colors.black,

                labelText: "Remarks",
              ),
              onChanged: (value){
                setState(() {
                  paymentRemarks=value;
                });

              },
            ),

            SizedBox(height: 45),
                //getPlatform()=='Desktop'||getPlatform()=='iOS'?Center(child: Image.asset('assets/images/upi_qr_image.jpeg',height: 300,)):Container(),
                Center(child: Image.asset('assets/images/upi_qr_image.jpeg',height: 300,)),
                // Image(image: NetworkImage('${widget.paymentDetails!.image}')),
                SizedBox(height: 45),
            TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyTheme.orange4),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async{
               // if(getPlatform()=='Desktop'||getPlatform()=='iOS'){
                var now = new DateTime.now();
                var formatter = new DateFormat('yyyy-MM-dd');
                String date = formatter.format(now);
                if (validateForm()){
                await FirebaseService().sendPaymentForVerification(date, paymentType, paymentMonth, year, paymentMode, paymentAmount, paymentRemarks, authId, context);
                FlutterToastService().showToast('Payment Sent for verification');
                // if(paymentMode!='Cash'&&paymentMode!='Cheque'&&paymentMode!='Security Deposit Use up'){
                // Navigator.pop(context);
                // await Navigator.push(context,MaterialPageRoute(builder: (context){
                //   return Webpayment(name: paymentType,image: '',price: webAmount,);
                // }));}
                resetForm();
                }
               // }
                // else{
                //   var now = new DateTime.now();
                //   var formatter = new DateFormat('yyyy-MM-dd');
                //   String date = formatter.format(now);
                //   if (validateForm()){
                //     if(paymentMode=='UPI')
                //     _launchURL();
                //
                //    showDialog<void>(
                //       context: context,
                //       barrierDismissible: false, // user must tap button!
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: const Text('Payment Verification'),
                //           content: SingleChildScrollView(
                //             child: ListBody(
                //               children: <Widget>[
                //                 Text('Only press approve if you have completed the payment'),
                //
                //               ],
                //             ),
                //           ),
                //           actions: <Widget>[
                //             TextButton(
                //               child:  Text('Approve',style: TextStyle(color: MyTheme.orange2)),
                //               onPressed: () async{
                //                 await FirebaseService().sendPaymentForVerification(date, paymentType, paymentMonth, year, paymentMode, paymentAmount, paymentRemarks, authId, context);
                //
                //                 FlutterToastService().showToast('Payment Sent for verification');
                //                 resetForm();
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //             TextButton(
                //               child:  Text('Deny',style: TextStyle(color: MyTheme.orange2),),
                //               onPressed: () async{
                //                 resetForm();
                //
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //
                //
                //   }
                // }

              },
              child: Text('Submit'),
            ),
                SizedBox(height: 10,),
                // getPlatform()=='Desktop'||getPlatform()=='iOS'?Text('Please click submit only after payment is complete',style:
                //   TextStyle(fontSize: 15,color: Colors.grey)
                //   ,):Container(),
                Text('Please click submit only after payment is complete',style:
                TextStyle(fontSize: 15,color: Colors.grey)
                  ,)
          ]),
        ));
  }
}
