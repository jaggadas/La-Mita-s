import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/home.dart';
import 'package:la_mita_admin/pages/login.dart';
import 'package:la_mita_admin/pages/mobile.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/services/Firebase.dart';
import 'package:la_mita_admin/site.dart';
import 'package:la_mita_admin/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: FirebaseService().getInitialScreen(),
        routes: {
          // "/":(context) => userdetails(),
          MyRoutes.loginRoute: (context) => loginPage(),
          MyRoutes.homeRoute: (context) => Home(),
          MyRoutes.mobileRoute: (context) => mobile(),
          MyRoutes.siteRoute: (context) => site(),
        });
  }
}
