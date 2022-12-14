import 'package:flutter/material.dart';
import 'package:la_mita/pages/ChatPage.dart';
import 'package:la_mita/pages/LeaveIssuePage.dart';
import 'package:la_mita/pages/home.dart';
import 'package:la_mita/pages/kyc_page.dart';
import 'package:la_mita/pages/login.dart';
import 'package:la_mita/pages/otp.dart';
import 'package:la_mita/pages/payment_details_page.dart';
import 'package:la_mita/pages/payment_history_page.dart';
import 'package:la_mita/pages/payment_page.dart';
import 'package:la_mita/pages/profile.dart';
import 'package:la_mita/pages/service_request_page.dart';
import 'package:la_mita/pages/splash_screen.dart';
import 'package:la_mita/pages/user_details.dart';
import 'package:la_mita/pages/visitor_entry_page.dart';
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

      home: loginPage(),
      routes: {
        // "/":(context) => userdetails(),
        MyRoutes.loginRoute: (context) => loginPage(),
        MyRoutes.splashRoute: (context) => splash_screen(),
        MyRoutes.otpRoute: (context) => otp(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.userdetailsRoute: (context) => userdetails(),
        MyRoutes.kycRoute: (context) => KycPage(),
        MyRoutes.visitorEntryRoute: (context) => VisitorEntryPage(),
        MyRoutes.serviceRequestRoute: (context) => ServiceRequestPage(),
        MyRoutes.paymentRoute: (context) => Payment(),
        MyRoutes.paymentHistoryRoute: (context) => PaymentHistory(),
        MyRoutes.myprofileRoute: (context) => myprofile(),
        MyRoutes.paymentDetailsRoute:(context)=>PaymentDetails(),
        MyRoutes.chatPageRoute:(context)=>ChatPage(),
        MyRoutes.leaveIssueRoute:(context)=>LeaveIssuePage()
      },
    );
  }
}
