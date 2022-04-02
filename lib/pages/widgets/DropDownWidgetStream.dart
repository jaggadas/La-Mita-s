import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/utils/UserModel.dart';

import '../../services/Firebase.dart';
import '../../utils/FirebaseConstants.dart';
var firestore=FirebaseFirestore.instance;
String selected_site="PRABHAT ROAD";
class SiteStream extends StatefulWidget {
  var enabled;
  var value;
  SiteStream({this.enabled ,this.value});

  @override
  State<SiteStream> createState() => _SiteStreamState();

  String getCurrentSite() {
    //print(selected_site);
    return selected_site;
  }
}

class _SiteStreamState extends State<SiteStream> {
  getSite()async{
    if(widget.value==''){
    selected_site=await FirebaseService().getInitialSite();
    setState((){
      selected_site;
    });}else{
    //  print(widget.value);
      UserModel user=await FirebaseService().getUserDetails();
      //print(user.site);
      selected_site=user.site;
     // print('disco $selected_site');
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSite();
  }

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
             onChanged:widget.enabled? (String? value) { setState(() {
            selected_site=value.toString();
            print(selected_site);
          }); }:null, );
        }
        return Expanded(child: Center(child: Text("No Sites")));
      },
      stream: firestore.collection(kSites).snapshots(),
    );
  }
}