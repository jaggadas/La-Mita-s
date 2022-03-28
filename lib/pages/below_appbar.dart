import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class below_appbar extends StatelessWidget {
  const below_appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 0),
        height: size.height * 0.2,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 130, bottom: 10, right: 20),
            height: size.height * 0.2 - 40,
            decoration: BoxDecoration(
                color: MyTheme.orange2.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(
              children: [
                Text(
                  'LA MITAS',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 55),
                )
              ],
            ),

            // child: AppBody(),
          )
        ]));
  }
}
