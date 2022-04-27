import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
class MobileNumberStream extends StatefulWidget {

  @override
  State<MobileNumberStream> createState() => _MobileNumberStreamState();
}

class _MobileNumberStreamState extends State<MobileNumberStream> {
  var searchController=TextEditingController();
  String searchResult = '';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<NumberItem> numbers = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          final numberData = snapshot.data?.docs;

          final numberDoc=numberData![0];
          final numberList=numberDoc.get(kNumber);
          if (numberList.length != 0) {

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
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: numberList.length,
                      itemBuilder: (BuildContext context ,int index){

                        var userNumber=numberList[index] ;

                        if (userNumber.contains(searchResult.toLowerCase())){
                          return NumberItem(phoneNumber: numberList[index]);
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
            return Expanded(child: Center(child: Text("No Users")));}
      }},
      stream: firestore.collection(kNumber).snapshots(),
    );
  }
}

class NumberItem extends StatelessWidget {
  NumberItem({required this.phoneNumber});
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
            //elevation: 10,
            child: Container(
                padding:  EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(phoneNumber, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                    IconButton(
                        onPressed: () async {
                          await firestore
                              .collection(kNumber)
                              .doc('QKLKZkSNh4tZcqdOgCQ0')
                              .update({
                            kNumber: FieldValue.arrayRemove([
                              phoneNumber
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
