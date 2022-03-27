import 'package:flutter/material.dart';
import 'package:la_mita/pages/appbody.dart';
import 'package:la_mita/pages/below_appbar.dart';
import 'package:la_mita/pages/drawer.dart';
import 'package:la_mita/pages/widgets/themes.dart';

import '../services/Firebase.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: MyTheme.orange2.withOpacity(0.8),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: MyTheme.orange2.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {FirebaseService().signOut(context);},
                icon: const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.payment_sharp,
                  size: 35,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [below_appbar(), AppBody()],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
