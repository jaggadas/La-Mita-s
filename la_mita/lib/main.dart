import 'package:flutter/material.dart';
import 'package:la_mita/pages/login.dart';
import 'package:la_mita/pages/otp.dart';
import 'package:la_mita/pages/splash_screen.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';

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
      routes: {
       // "/":(context) => HomePage(),
         MyRoutes.loginRoute: (context) => loginPage(),
         MyRoutes.splashRoute: (context) => splash_screen(),
         MyRoutes.otpRoute: (context) => otp(),

      },
      
    );
  }
}

