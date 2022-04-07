import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:la_mita/utils/Constants.dart';

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
  bool changeButton = true;
  String dropdownValue = 'January';

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

            TextFormField(
              cursorColor: MyTheme.orange4,
              decoration: kInputDecoration.copyWith(
                hintText: "Date of Payment",

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                // icon: const Icon(Icons.calendar_month),
                // iconColor: Colors.black,

                labelText: "dd/mm/yyyy",
              ),
            ),
            SizedBox(
              height: 40,
            ),

            // ListTile(
            // title:
            const Text('Payment Type', style: TextStyle(fontSize: 22)),
            RadioListTile(
                title: const Text('Rent'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            RadioListTile(
                title: const Text('Security Deposit'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            RadioListTile(
                title: const Text('Token Amount'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
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
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            RadioListTile(
                title: const Text('2021'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            RadioListTile(
                title: const Text('2022'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),
            RadioListTile(
                title: const Text('2023'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),
            RadioListTile(
                title: const Text('2024'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            SizedBox(
              height: 40,
            ),

            const Text('Mode of Payment', style: TextStyle(fontSize: 22)),
            RadioListTile(
                title: const Text('Cash'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            RadioListTile(
                title: const Text('Cheque'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),
            RadioListTile(
                title: const Text('Gpay'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),
            RadioListTile(
                title: const Text('PhonePay'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),
            RadioListTile(
                title: const Text('Paytm'),
                value: 1,
                groupValue: _result,
                onChanged: (value) {
                  setState(() {
                    _result = value;
                  });
                }),

            SizedBox(height: 40),

            TextFormField(
              cursorColor: MyTheme.orange2,
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
              onPressed: () {},
              child: Text('Submit'),
            )
          ]),
        ));
  }
}
