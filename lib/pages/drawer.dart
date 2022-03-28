import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';

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
              /*    DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: MyTheme.orange2.withOpacity(0.6),
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: MyTheme.orange2),
                   // margin: EdgeInsets.zero,
                    accountName: Text(""),
                    accountEmail: Text(""),
                  ),
                ),
              ), */
              ListTile(
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
                leading: Icon(
                  CupertinoIcons.mail,
                  size: 35,
                  color: Colors.white,
                ),
                title: Text("Contact us",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,fontSize: 16
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
