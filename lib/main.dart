import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/home.dart';
import 'package:la_mita_admin/pages/login.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyTheme.orange,
        accentColor: MyTheme.orange2,
      ),
      initialRoute: MyRoutes.loginRoute,
      home: loginPage(),
      routes: {
        // "/":(context) => userdetails(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.homeRoute: (context) => Home(),

       } );
     
    
 }
}
