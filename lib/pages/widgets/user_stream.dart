import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
class UserStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<UserItem> sites = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final userData = snapshot.data?.docs;
        if(userData?.length!=0){
        for (var user in userData!) {

          if (user.exists) {
              final userName=user.get(kName);
              final userEmail=user.get(kEmail);
              final userPhone=user.get(kPhone);
              final userSite=user.get(kSite);
              final userWidget =
             UserItem(userName: userName, userPhone: userPhone, userEmail: userEmail, userSite: userSite);
              sites.add(userWidget);
          }

        }
        return Expanded(
            child: ListView(
              children: sites,
            ));}

        return Expanded(child: Center(child: Text("No Users")));
      },
      stream: firestore.collection(kUsers).orderBy(kSite).snapshots(),
    );
  }
}

class UserItem extends StatelessWidget {
  UserItem({required this.userName,required this.userPhone,required this.userEmail,required this.userSite});
  String userName;
  String userEmail;
  String userPhone;
  String userSite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
            elevation: 10,
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(userName),
                        Text(userSite)

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(userEmail),
                        Text(userPhone)
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
