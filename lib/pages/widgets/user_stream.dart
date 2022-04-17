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
String searchResult = '';
class _UserStreamState extends State<UserStream> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

      builder: (context, snapshot) {


        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else{
        final userData = snapshot.data?.docs;
        if (userData?.length != 0) {

          return Column(
            children: [
              //search bar do not extract into new widget
          Container(
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
        onChanged: (value){
        setState(() {
        searchResult=value;
        });
        print(searchResult);
        },
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
        ),
              Expanded(
                child: ListView.builder(
                  itemCount: userData!.length,
                    itemBuilder: (BuildContext context ,int index){
                      DocumentSnapshot user = userData[index];
                      String userName=user.get(kName) ;
                      String userSite= user.get(kSite);
                      if (userName.toLowerCase().contains(searchResult.toLowerCase())||
                         userSite.toLowerCase().contains(searchResult.toLowerCase())){
                        return UserItem(userName: user.get(kName), userPhone: user.get(kPhone), userEmail: user.get(kEmail), userSite: user.get(kSite), userId: user.id);
                      }else {
                        return
                        Center(
                          child: Container()
                        );
                      }
                }),
              ),
            ],
          );
        }else{
        return Expanded(child: Center(child: Text("No Users")));}}
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

