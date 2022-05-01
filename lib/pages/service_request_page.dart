import 'package:la_mita/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/getLinks.dart';

import '../services/Firebase.dart';
import '../utils/UserModel.dart';

class ServiceRequestPage extends StatefulWidget {
  @override
  _ServiceRequestPageState createState() => _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage> {
  late String name,email,site,phone;
  bool isNotLoaded=true;

  static ValueKey key = ValueKey('key_0');
  bool _isHtml = false;
  bool _blockNavigation = false;
  bool _isMarkdown = false;
  bool _useWidgets = false;
  bool _isSelectable = false;
  bool open = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseDetails();
  }
  void initialiseDetails() async {
    UserModel user = await FirebaseService().getUserDetails();
    setState(() {
      name = user.name;
      email = user.email;
      site = user.site;
      phone = user.phone;
      isNotLoaded=false;
      print(isNotLoaded);
    });
  }

  @override
  Widget build(BuildContext context) {
    // var snackBar = SnackBar(
    //   content: Text('This page may take some time to load'),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return Scaffold(
        appBar: AppBar(
          title: Text('Service Request'),
          backgroundColor: MyTheme.orange2,


        ),
        body: isNotLoaded? Center(child: CircularProgressIndicator(),):Stack(
          children: <Widget>[
            Column(
              children: <Widget>[

                Expanded(
                    flex: 1,
                    child: EasyWebView(

                      src:  GetLinks().getServiceRequestLink(name, email),
                      onLoaded: () {

                      },
                      isHtml: _isHtml,
                      isMarkdown: _isMarkdown,
                      convertToWidgets: _useWidgets,
                      key: key,
                      widgetsTextSelectable: _isSelectable,
                      webNavigationDelegate: (_) => _blockNavigation
                          ? WebNavigationDecision.prevent
                          : WebNavigationDecision.navigate,
                      crossWindowEvents: [
                        CrossWindowEvent(
                            name: 'Test',
                            eventAction: (eventMessage) {
                              print('Event message: $eventMessage');
                            }),
                      ],
                      // width: 100,
                      // height: 100,
                    )),

              ],
            ),

          ],
        ));
  }


}
