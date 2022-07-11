import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/pending_verification_stream.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/verified_stream.dart';

import '../services/Firebase.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
   
  Widget build(BuildContext context){
    FirebaseService().autoReturnToHomePage(context);
    return DefaultTabController(
    length: 2, 
    child:  Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.orange2,
        title: Text('Payment History'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 28,
          )
        ],
        bottom: TabBar(
           indicatorColor: Colors.white,
  labelColor: Colors.white,
  unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(icon: Icon(Icons.verified_user), text: 'Verified'),
            Tab(icon: Icon(Icons.no_accounts), text: 'Pending')],
        ),
      ),
     body: TabBarView(children: [VerifiedStream(),PaymentVerificationStream()]),

    )
  );}
  
}
