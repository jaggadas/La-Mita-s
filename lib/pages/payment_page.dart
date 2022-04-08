import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.orange4,
        title: Text('Payment'),
      ),
      body: Mypaymentform(),
    );
  }
}

class Mypaymentform extends StatefulWidget {
  const Mypaymentform({Key? key}) : super(key: key);

  @override
  State<Mypaymentform> createState() => _MypaymentformState();
}

class _MypaymentformState extends State<Mypaymentform> {
  var _result;
  var _result1;
  var _result2;
  String date='';
  String paymentType='';
  String paymentMonth='';
  String year='';
  String paymentMode='';
  String paymentAmount='';
  String paymentRemarks='';
  String authId=FirebaseService().getAuthId().toString();

  bool changeButton = true;
  String dropdownValue = 'January';
  validateForm(){
    if(date==''){
      FlutterToastService().showToast('Please Enter Valid Date');
      return false;}
    else if(paymentType==''){
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
            const Text('Date of Payment', style: TextStyle(fontSize: 22)),

            SizedBox(height: 20),

                DateTimeFormField(
                  initialDate: DateTime.now(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: MyTheme.orange2),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder( borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(14)),),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date',
                  ),

                  mode: DateTimeFieldPickerMode.date,

                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    date=value.toString().split(' ')[0];
                  },
                ),
            SizedBox(
              height: 40,
            ),

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
                title: const Text('2020'),
                value: '2020',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),

            RadioListTile(
                title: const Text('2021'),
                value: '2021',
                groupValue: _result1,
                onChanged: (value) {
                  setState(() {
                    _result1 = value;
                    year=value.toString();
                  });
                }),

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
                title: const Text('Gpay'),
                value: 'Gpay',
                groupValue: _result2,
                onChanged: (value) {
                  setState(() {
                    _result2 = value;
                    paymentMode=value.toString();
                  });
                }),
            RadioListTile(
                title: const Text('PhonePay'),
                value: 'PhonePay',
                groupValue: _result2,
                onChanged: (value) {
                  setState(() {
                    _result2 = value;
                    paymentMode=value.toString();
                  });
                }),
            RadioListTile(
                title: const Text('Paytm'),
                value:'Paytm',
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
                });

              },
            ),

            SizedBox(height: 40),

            TextFormField(
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

            TextButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyTheme.orange4),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async{
                print("$date\n$paymentType\n$paymentMonth\n$year\n$paymentMode\n$paymentAmount\n$paymentRemarks");
                if (validateForm()){
                await FirebaseService().sendPaymentForVerification(date, paymentType, paymentMonth, year, paymentMode, paymentAmount, paymentRemarks, authId, context);}

              },
              child: Text('Submit'),
            )
          ]),
        ));
  }
}