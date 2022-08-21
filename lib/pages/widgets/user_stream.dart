import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/customer_details.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/services/Firebase.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
import 'package:la_mita_admin/utils/UserModel.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
    FirebaseService().deleteNumbersAutomatically();
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
                      String userLeavingDate='';
                      if(user.get(kLeavingDate)!=null){
                         userLeavingDate=user.get(kLeavingDate);
                      }
                      var now = new DateTime.now();
                      var formatter = new DateFormat('yyyy-MM-dd');
                      var curdate=formatter.format(now);


                      if ((userName.toLowerCase().contains(searchResult.toLowerCase())||
                         userSite.toLowerCase().contains(searchResult.toLowerCase()))){
                        //&&(userLeavingDate.compareTo(curdate)==1&&userLeavingDate!='')
                        if(userLeavingDate==''){
                        return UserItem(userName: user.get(kName), userPhone: user.get(kPhone), userEmail: user.get(kEmail), userSite: user.get(kSite), userId: user.id,leavingDate: user.get(kLeavingDate),);}
                        else{

                          if(userLeavingDate.compareTo(curdate)==1) {
                            return UserItem(userName: user.get(kName),
                                userPhone: user.get(kPhone),
                                userEmail: user.get(kEmail),
                                userSite: user.get(kSite),
                                userId: user.id,
                                leavingDate:user.get(kLeavingDate)
                            );
                          }
                        else{return Container();}
                        }
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
      required this.userId,
      required this.leavingDate
      }) {

  }
  String userName;
  String userEmail;
  String userPhone;
  String userSite;
  String userId;
  String leavingDate;
  RelativeRect buttonMenuPosition(BuildContext context) {
    final bool isEnglish =
      true;
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context)!.context.findRenderObject() as RenderBox;
    const Offset offset = Offset.zero;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(
            isEnglish
                ? bar.size.centerRight(offset)
                : bar.size.centerLeft(offset),
            ancestor: overlay),
        bar.localToGlobal(
            isEnglish
                ? bar.size.centerRight(offset)
                : bar.size.centerLeft(offset),
            ancestor: overlay),
      ),
      offset & overlay.size,
    );
    return position;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(children: [
          Container(
            child: GestureDetector(
              onLongPress: (){
                final RelativeRect position =
                buttonMenuPosition(context);
                showMenu(context: context, position:  position  // Bigger rect, the entire screen
                , items:  <PopupMenuEntry>[
                    PopupMenuItem(
                      value: userId,
                      onTap: (){FirebaseService().deleteUser(userId, context);},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete,color: MyTheme.orange2,),
                          Text("Delete"),
                        ],
                      ),
                    )
                  ],);
              // PopupMenuButton(
              //     itemBuilder:(context) => [
              //       PopupMenuItem(
              //         child: Text("First"),
              //         value: 1,
              //       ),
              //       PopupMenuItem(
              //         child: Text("Second"),
              //         value: 2,
              //       )
              //     ]
              // );
                },
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerDetails(
                    userModel: UserModel(
                        phone: userPhone,
                        email: userEmail,
                        name: userName,
                        site: userSite,
                        id: userId,
                      leavingDate:leavingDate
                    ),
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
                                        id: userId,
                                    leavingDate: leavingDate),
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

