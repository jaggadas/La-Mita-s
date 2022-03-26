import 'package:flutter/material.dart';
import 'package:la_mita/pages/below_appbar.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      optCards(
          image: 'assets/images/disco.png', title: 'KYC', product: 'PRoduct'),
      optCards(
          image: 'assets/images/disco.png',
          title: 'Visitor Entry',
          product: 'PRoduct'),
      optCards(
          image: 'assets/images/Asset3.png',
          title: 'Service Request',
          product: 'PRoduct'),
      optCards(
          image: 'assets/images/disco.png',
          title: 'Payment',
          product: 'PRoduct'),
      optCards(
          image: 'assets/images/disco.png',
          title: 'Payment History',
          product: 'PRoduct')
    ]);
  }
}

class optCards extends StatelessWidget {
  const optCards({
    Key? key,
    required this.image,
    required this.title,
    required this.product,
  }) : super(key: key);
  final String image, title, product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
          left: 0,
          top: 10,
          bottom: 50,
        ),
        width: size.width * 0.8,
        height: size.height * 0.2,
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          GestureDetector(
              child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: MyTheme.orange2.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: MyTheme.orange2.withOpacity(0.5),
                  )
                ]),
            child: Row(
              children: [
                Image.asset(
                  image,
                  height: 100,
                  width: 100,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "$title\n",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  TextSpan(
                    text: "$product".toUpperCase(),
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )
                ])),
              ],
            ),
          ))
        ]));
  }
}
