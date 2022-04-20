import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/messagesStream.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/UserModel.dart';
class ChatPage extends StatefulWidget {
  ChatPage({this.userSite});
  String? userSite;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Chat'),backgroundColor: MyTheme.orange2,),
      body: Column(
        children: [
          MessagesStream(siteName: widget.userSite!,),
        ],
      ),
    );
  }
}
