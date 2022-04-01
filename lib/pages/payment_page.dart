import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MyTheme.orange2,title: Text('Payment'),),);
  }
}
