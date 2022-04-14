import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/pending_stream.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/pages/widgets/user_stream.dart';
import 'package:la_mita_admin/services/Firebase.dart';
import 'package:la_mita_admin/utils/routes.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2, 
    child:Scaffold(
      appBar:
       AppBar(
          backgroundColor: MyTheme.orange2,
           title: Text('Home'),
          leading: IconButton(onPressed: (){FirebaseService().signOut(context);}, icon: Icon(Icons.close)),
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
            Tab(icon: Icon(Icons.verified_user), text: 'Customers'),
            Tab(icon: Icon(Icons.add_alert), text: 'Pending')],
        ),
       ),

         bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyTheme.orange2, MyTheme.orange2],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1),
            stops: [0, 1.0],
          ),
          //color: MyTheme.orange2.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          
            IconButton(
                onPressed: () => Navigator.pushNamed(context, MyRoutes.mobileRoute),
                icon: const Icon(
                  Icons.mobile_screen_share,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, MyRoutes.siteRoute) ,
                icon: const Icon(
                  Icons.input,
                  size: 30,
                  color: Colors.white,
                ))
          ],
        ),
      ),
       body: 
       TabBarView(children: [UserStream(),PaymentVerificationStream()]),
      
  ));
  }
