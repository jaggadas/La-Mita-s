import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
          color: MyTheme.orange2,
          child: ListView(
            padding: EdgeInsets.only(top: 30.0),
            children: [

              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(
                  CupertinoIcons.home,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text("Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                    )),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.myprofileRoute);
                },
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text("Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white, fontSize: 16,
                    )),
              ),

              ListTile(
                onTap: () {
                  FirebaseService().signOut(context);
                },
                leading: Icon(
                  CupertinoIcons.arrow_left,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text("Log out",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
                    )),
              ),
            ],
          )),
    );
  }
}
