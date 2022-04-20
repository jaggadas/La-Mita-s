import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/site_stream_chat.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
class ChatSiteSelection extends StatelessWidget {
  const ChatSiteSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MyTheme.orange2,
      title: Text('Select Site'),),
    body: Column(children: [
      ChatSiteStream()

    ],),
    );
  }
}
