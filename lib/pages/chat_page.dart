import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/messages_stream.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/services/Firebase.dart';
import 'package:telephony/telephony.dart';
class ChatPage extends StatefulWidget {
  ChatPage({this.siteName});
  String? siteName  ;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String text='';
  var messageTextController=TextEditingController();
  final Telephony telephony = Telephony.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestAccess();
  }
  requestAccess()async{
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
  }
  sendSMS(String message,String number){
    print("Sending message to :$number");
    telephony.sendSms(
        to: number,
        message: message
    );
  }
  sendSMStoBatch(String message)async{
   List numbers=await FirebaseService().getSiteNumberList(widget.siteName!.replaceAll(' ', '.'), context);
   print("numbers $numbers");
   for (String number in numbers){
     sendSMS(message, number);
   }
  }
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
                        sendSMStoBatch(text);
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

