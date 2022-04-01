import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/below_appbar.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/services/getLinks.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/UserModel.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  String name = 'Username';
  String email = 'username@email.com';
  String site = 'BKC';
  String phone = '111111';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseDetails();
  }

  void initialiseDetails() async {
    UserModel user = await FirebaseService().getUserDetails();
    setState(() {
      name = user.name;
      email = user.email;
      site = user.site;
      phone = user.phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    initialiseDetails();
    // Size size = MediaQuery.of(context).size;
    return Column(children: [
      optCards(
        image: 'assets/images/KYC.png',
        title: '     KYC                ',
        product: ' ',
        onPressed: () async {
          Navigator.pushNamed(context, MyRoutes.kycRoute);
        },
      ),
      optCards(
        image: 'assets/images/visitor.png',
        title: '     Visitor Entry        ',
        product: ' ',
        onPressed: () async {
          Navigator.pushNamed(context, MyRoutes.visitorEntryRoute);
        },
      ),
      optCards(
        image: 'assets/images/service1.png',
        title: '     Service Request    ',
        product: ' ',
        onPressed: () async {
          Navigator.pushNamed(context, MyRoutes.serviceRequestRoute);
        },
      ),
      optCards(
        image: 'assets/images/cashless-payment.png',
        title: '     Payment        ',
        product: ' ',
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.paymentRoute);
        },
      ),
      optCards(
        image: 'assets/images/payment.png',
        title: '     Payment History    ',
        product: ' ',
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.paymentHistoryRoute);
        },
      )
    ]);
  }
}

class optCards extends StatelessWidget {
  optCards(
      {Key? key,
      required this.image,
      required this.title,
      required this.product,
      required this.onPressed})
      : super(key: key);
  final String image, title, product;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(

          margin: EdgeInsets.only(
            left: 0,
            top: 10,
            bottom: 50,
          ),
          width: size.width * 0.8,
          // height: size.height * 0.2,
          child: Column(children: [
            // IconButton(onPressed: () {},icon: const Icon(
            //   Icons.payment_sharp,
            //  ),),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [MyTheme.orange4, MyTheme.orange2],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0, 1.0],
                  ),
                  color: MyTheme.orange2.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: MyTheme.orange2.withOpacity(0.5),
                      blurRadius: 40,
                      offset: Offset(0.0, 1.5)
                    )
                  ]),
              child: Row(
                children: [
                  //  InkWell(
                  // onTap: () {

                  //   },
                  //  ),

                  Image.asset(
                    image,
                    height: 80,
                    width: 80,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "$title\n",
                      // recognizer: new TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    TextSpan(
                      text: "$product".toUpperCase(),
                      style: TextStyle(
                          color: MyTheme.orange2.withOpacity(0.4),
                          fontSize: 10),
                    )
                  ])),
                ],
              ),
            )
          ])),
    );
  }
}
