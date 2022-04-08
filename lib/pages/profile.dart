import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/DropDownWidgetStream.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/Constants.dart';

import '../services/Firebase.dart';
import '../utils/UserModel.dart';

class myprofile extends StatefulWidget {
  const myprofile({Key? key}) : super(key: key);

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  bool edit=false;
  String name = 'Username';
  String email = 'username@email.com';
  String site = 'BKC';
  String phone = '111111';
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController siteController=TextEditingController();


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
    nameController.text=name;
    emailController.text=email;
    phoneController.text=phone;
    siteController.text=site;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(

          
          title: 
          Text("My Profile"),
          
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: MyTheme.orange4,
          elevation: 0,

        ),
        body: Container(
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.only(left: 60, right: 60, top: 30),
              child: Column(children: [
                 Image.asset(
                    'assets/images/PROF.png',
                   height: 200,
                  ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row()
                ),
                TextField(
                  controller: phoneController,
                  enabled: false,
                  decoration: kInputDecoration.copyWith(
                      labelText: "Phone",
                      hintText: 'Enter Phone',
                      // hintText: "Sejal Kothari",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      )
                  ),

                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: nameController,
                 enabled: false,
                  decoration: kInputDecoration.copyWith(
                  labelText: "Name",
                 hintText: 'Enter Name',
                 // hintText: "Sejal Kothari",
                  hintStyle: TextStyle(  
                    fontSize: 18,
                    color: Colors.grey,
                  ) 
                ),

              ),
              SizedBox(
                height: 40,
              ),
               TextField(
                 controller: emailController,
                 enabled: false,
                 decoration:kInputDecoration.copyWith(
                  labelText: "Email ID",
                 hintText: 'Enter Email',
                 // hintText: "Sejal Kothari",
                  hintStyle: TextStyle(  
                    fontSize: 18,
                    color: Colors.grey,
                  ) 
                ),
              ),
               SizedBox(
                height: 40,
              ),
                TextField(
                  controller: siteController,
                  enabled: false,
                  decoration:kInputDecoration.copyWith(
                      labelText: "Site",
                      hintText: 'Enter Site',
                      // hintText: "Sejal Kothari",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      )
                  ),
                ),


              ]
              ),
          ),
        ]
        )
        )
        );
  }
}
