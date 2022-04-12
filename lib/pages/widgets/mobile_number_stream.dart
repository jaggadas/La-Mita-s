import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
class MobileNumberStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<DishItem> numbers = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final numbersData = snapshot.data?.docs;
        for (var number in numbersData!) {
              List numbersList = number.get(kNumber);
              if (numbersList.isNotEmpty) {
                for (var numberItem in numbersList) {
                 final mobile=numberItem.toString();
                  final dishWidget =
                  DishItem(dishName: mobile);
                  numbers.add(dishWidget);
                }
              }
              return Expanded(
                  child: ListView(
                    children: numbers,
                  ));
        }
        return Expanded(child: Center(child: Text("No Dishes")));
      },
      stream: firestore.collection(kNumber).snapshots(),
    );
  }
}

class DishItem extends StatelessWidget {
  DishItem({required this.dishName});
  String dishName;

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(dishName),

                    IconButton(
                        onPressed: () async {
                          await firestore
                              .collection(kNumber)
                              .doc('QKLKZkSNh4tZcqdOgCQ0')
                              .update({
                            kNumber: FieldValue.arrayRemove([
                              dishName
                            ])
                          });
                        },
                        icon: Icon(Icons.delete))
                  ],
                ))),
      ),
    );
  }
}
