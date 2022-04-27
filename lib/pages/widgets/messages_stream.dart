import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/site.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';

var _firestore=FirebaseFirestore.instance;
class MessagesStream extends StatelessWidget {
  var siteName;
  MessagesStream({this.siteName}){
    print('discodancing'+siteName);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs.reversed;

        for (var doc in docs) {
          final messages=doc.get(siteName);
          for(var message in messages){

            messageWidgets.add(MessageBubble(text: message.keys.elementAt(0)));
          }
          messageWidgets=messageWidgets.reversed.toList();
          return Expanded(
            child: ListView(reverse: true,
              children: messageWidgets,
            ),
          );
        }
        return Text('No Chats');
      },
      stream: _firestore.collection(kChat).snapshots(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final text;

  MessageBubble({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.end,
        children: [

          Material(
              color:MyTheme.orange2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              elevation: 5,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$text',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}

