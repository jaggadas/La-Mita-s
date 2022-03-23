import 'package:flutter/material.dart';
import 'package:la_mita/pages/home.dart';
import 'package:la_mita/pages/login.dart';
import 'package:la_mita/pages/otp.dart';
import 'package:la_mita/pages/splash_screen.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey:"AIzaSyBSAaV3NeyX7rnD_UOdo7H96APjLqDVgQE", appId: "1:981946317479:web:2717b1ae871a83f012f982", messagingSenderId: "981946317479", projectId:"lamita-s")
  );
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
        MyRoutes.homeRoute:(context)=>Home(),


      },
      
    );
  }
}

