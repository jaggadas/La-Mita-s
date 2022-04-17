import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/customer_details.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
import 'package:la_mita_admin/utils/UserModel.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class UserStream extends StatefulWidget {

  @override
  State<UserStream> createState() => _UserStreamState();
}
TextEditingController searchController=TextEditingController();
class _UserStreamState extends State<UserStream> {
  // List<UserItem> mainDataList=[];
  // List<UserItem> newDataList = List.from(mainDataList);
  //
  //
  // void onSearchChanged(String value){
  //   print(searchController.text);
  //   setState(() {
  //     newDataList = mainDataList
  //         .where((string) => string.userSite.toLowerCase().contains(value.toLowerCase())|| string.userName.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

      builder: (context, snapshot) {
        List<Widget> sites = [];
        sites.add(below_appbar());
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final userData = snapshot.data?.docs;
        if (userData?.length != 0) {
          for (var user in userData!) {
            if (user.exists) {
              final userName = user.get(kName);
              final userEmail = user.get(kEmail);
              final userPhone = user.get(kPhone);
              final userSite = user.get(kSite);
              final userId = user.id;

              final userWidget = UserItem(
                userName: userName,
                userPhone: userPhone,
                userEmail: userEmail,
                userSite: userSite,
                userId: userId,
              );
              sites.add(userWidget);
            }
          }
          return ListView(
            children: sites,
          );
        }

        return Expanded(child: Center(child: Text("No Users")));
      },
      stream: firestore.collection(kUsers).orderBy(kSite).snapshots(),
    );
  }
}

class UserItem extends StatelessWidget {
  UserItem(
      {required this.userName,
      required this.userPhone,
      required this.userEmail,
      required this.userSite,
      required this.userId}) {
    print('UID $userId');
  }
  String userName;
  String userEmail;
  String userPhone;
  String userSite;
  String userId;



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(children: [
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerDetails(
                    userModel: UserModel(
                        phone: userPhone,
                        email: userEmail,
                        name: userName,
                        site: userSite,
                        id: userId),
                  );
                }));
              },
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      child: InkWell(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [MyTheme.orange4, MyTheme.orange2],
                                    begin: FractionalOffset(0, 0),
                                    end: FractionalOffset(0, 1),
                                    stops: [0, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyTheme.orange2),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                         mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    children: [
                                      Row(
                                        // mainAxisAlignment:
                                      //  MainAxisAlignment.spaceEvenly,
                                           children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8,),
                                      Text(
                                        userName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                           ]
                                           ),

                                      // SizedBox(width: 80,),

                                      Row(
                                        children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                       SizedBox(width: 8,),
                                      Text(userPhone,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white))
                                        ]),
                                      ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children:[
                                      Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                       SizedBox(width: 8,),
                                      Text(userEmail,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white)),
                                                // SizedBox(width: 65,),

                                            ]),    SizedBox(width: 8,),

                                            Row(
                                              children:[
                                                 Text('Site:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
 SizedBox(width: 4,),
                                      Text(userSite,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white))
                                      ]),  ],
                                  ),
                                ],
                              )),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CustomerDetails(
                                    userModel: UserModel(
                                        phone: userPhone,
                                        email: userEmail,
                                        name: userName,
                                        site: userSite,
                                        id: userId),
                                  );
                                },
                              ),
                            );
                          }),
                    )
                  ])),
            ),
          ),
        ]));
  }
}

class below_appbar extends StatefulWidget {
  // below_appbar(this.onSearchChanged);
  // VoidCallback onSearchChanged;

  @override
  State<below_appbar> createState() => _below_appbarState();
}

class _below_appbarState extends State<below_appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      height: 52,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4.5), blurRadius: 12, color: MyTheme.orange2)
          ]),
      child: Container(
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: searchController,
              //onChanged: (value){widget.onSearchChanged;},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 30),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Icon(
            CupertinoIcons.search,
            color: Colors.grey,
            size: 30,
          ),
          Padding(padding: EdgeInsets.only(right: 18))
        ]),
      ),
    );
  }
}
