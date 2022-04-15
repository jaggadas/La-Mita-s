import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
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

    return 
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Material(
            elevation: 0,
            child: InkWell(
              child: Container(
                
                 padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
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
                         crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Text(userName, style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text(userPhone, style: TextStyle(fontSize: 16, color: Colors.white))
            
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(userEmail, style: TextStyle(fontSize: 14, color: Colors.white)),
                          Text(userSite, style: TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ], 
                 )
                 ),
                 onTap: (){},
            ),
               

   )
    
      
     ) ); 
  }
}

class userCards extends StatelessWidget {
  const userCards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
