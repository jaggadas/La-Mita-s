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
            padding: EdgeInsets.only(left: 20, bottom: 25, right: 20),
            height: size.height * 0.2 - 40,
            decoration: BoxDecoration( gradient: LinearGradient(
                    colors: [MyTheme.orange4, MyTheme.orange2],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0, 1.0],
                  ),
                //color: MyTheme.orange2.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
               Image.asset('assets/images/Accomodation.png',)
              ],
            ),


          )
        ]));
  }
}
