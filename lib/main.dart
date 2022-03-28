import 'package:flutter/material.dart';
import 'package:la_mita/pages/home.dart';
import 'package:la_mita/pages/login.dart';
import 'package:la_mita/pages/otp.dart';
import 'package:la_mita/pages/splash_screen.dart';
import 'package:la_mita/pages/user_details.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD6su9XMXtAJh3KTF4AxXUNfYbK08o5nuc",
          appId: "1:210896378745:web:a4dc8d20dfd73017b1eda8",
          messagingSenderId: "210896378745",
          projectId: "la-mitas"));
  runApp(const MyApp());
}
//party time
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

      home: FirebaseService().getInitialScreen(),

      routes: {
        // "/":(context) => userdetails(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.splashRoute: (context) => splash_screen(),
        MyRoutes.otpRoute: (context) => otp(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.userdetailsRoute: (context) => userdetails(),
      },
    );
  }
}
