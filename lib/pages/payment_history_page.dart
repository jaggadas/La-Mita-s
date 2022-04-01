import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MyTheme.orange2,title: Text('Payment History'),),);
  }
}
