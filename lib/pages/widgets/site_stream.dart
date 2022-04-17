import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
class SiteStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<SiteItem> sites = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final sitesData = snapshot.data?.docs;
        for (var site in sitesData!) {
          List sitesList = site.get(kSites);
          if (sitesList.isNotEmpty) {
            for (var siteItem in sitesList) {
              final siteName=siteItem.toString();
              final siteWidget =
              SiteItem(siteText: siteName);
              sites.add(siteWidget);
            }
          }
          return Expanded(
              child: ListView(
                children: sites,
              ));
        }
        return Expanded(child: Center(child: Text("No Sites")));
      },
      stream: firestore.collection(kSites).snapshots(),
    );
  }
}

class SiteItem extends StatelessWidget {
  SiteItem({required this.siteText});
  String siteText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          
           // elevation: 10,
            
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    gradient:  LinearGradient(
                    colors: [MyTheme.orange4, MyTheme.orange2],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0, 1.0],
                  ),
                    borderRadius: BorderRadius.circular(10),
                   // color: Colors.white
                   ),
                child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(siteText, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                    IconButton(
                        onPressed: () async {
                          await firestore
                              .collection(kSites)
                              .doc('EFlzXTaKAyhihMyeQzTI')
                              .update({
                            kSites: FieldValue.arrayRemove([
                              siteText
                            ])
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.white,))
                  ],
                ))),
      ),
    );
  }
}
