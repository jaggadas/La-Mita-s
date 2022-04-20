import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/messages_stream.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/services/Firebase.dart';
class ChatPage extends StatefulWidget {
  ChatPage({this.siteName});
  String? siteName  ;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String text='';
  var messageTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.siteName=widget.siteName!.replaceAll('.', ' ');
    print(widget.siteName);
    return Scaffold(appBar: AppBar(title: Text(widget.siteName!),backgroundColor: MyTheme.orange2,),body:
    SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MessagesStream(siteName:widget.siteName),
          Container(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Expanded(
                  child: TextField(
                    controller: messageTextController,

                    onChanged: (value) {
                      //Do something with the user input.
                      text=value;
                    },

                  ),
                ),
                FlatButton(
                  onPressed: () {
                      if(text!=''){
                        messageTextController.clear();
                        //Implement send functionality.
                        FirebaseService().sendMessage(widget.siteName!, text);
                      }
                  },
                  child: Text(
                    'Send',style:  TextStyle(
                    color: MyTheme.orange2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}

