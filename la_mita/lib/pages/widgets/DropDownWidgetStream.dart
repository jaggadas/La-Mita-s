import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';

import '../../utils/FirebaseConstants.dart';
var firestore=FirebaseFirestore.instance;
String selected_site="";
class SiteStream extends StatefulWidget {
  const SiteStream({Key? key}) : super(key: key);

  @override
  State<SiteStream> createState() => _SiteStreamState();

  String getCurrentSite() {
    return selected_site;
  }
}

class _SiteStreamState extends State<SiteStream> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<DropdownMenuItem<String>> sites = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final sitesData = snapshot.data?.docs;

        for (var site in sitesData!) {
          List sitesArray = site.get(kSites);
          selected_site=sitesArray[0];
          if (sitesArray.isNotEmpty) {
            for (var site in sitesArray) {

              sites.add( DropdownMenuItem(child: Text('$site'),value: '$site',));
            }
          }
          return DropdownButtonFormField(
            decoration: InputDecoration(
              focusColor: MyTheme.orange2,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyTheme.orange2)),
            ),
            items: sites,value: selected_site,
             onChanged: (String? value) { setState(() {
            selected_site=value.toString();
            print(selected_site);
          }); }, );
        }
        return Expanded(child: Center(child: Text("No Sites")));
      },
      stream: firestore.collection(kSites).snapshots(),
    );
  }
}