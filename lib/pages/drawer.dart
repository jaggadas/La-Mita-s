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
        
          color: MyTheme.orange2.withOpacity(0.20),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,

                child: Container(
                  color: MyTheme.orange2.withOpacity(0.6),
                  child: UserAccountsDrawerHeader(
                    decoration:  BoxDecoration(color: MyTheme.orange2),
                    margin: EdgeInsets.zero,
                    accountName: Text("LA_MITA"),
                    accountEmail: Text("lamita12@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/disco.png'),
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                ),
                title: Text("Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              ListTile(
                 onTap: () {},
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.black,
                ),
                title: Text("Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              ListTile(
                 onTap: () {},
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.black,
                ),
                title: Text("Contact us",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              ListTile(
                 onTap: () {
                   FirebaseService().signOut(context);
                 },
                leading: Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.black,
                ),
                title: Text("Log out",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ],
          )),
    );
  }
}
