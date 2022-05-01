import 'package:la_mita/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/services/getLinks.dart';

import '../services/Firebase.dart';
import '../utils/UserModel.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class KycPage extends StatefulWidget {
  @override
  _KycPageState createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
  late String name,email,site,phone;
  bool isNotLoaded=true;
  bool showSpinner=true;

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
      //print(isNotLoaded);
    });
    FlutterToastService().showToast('This page may take some time to load...') ;
  }

  @override
  Widget build(BuildContext context) {
    //initialiseDetails();
    return Scaffold(
        appBar: AppBar(
          title: Text('KYC'),
          backgroundColor: MyTheme.orange2,


        ),
        body: isNotLoaded? Center(child: CircularProgressIndicator(),):
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: EasyWebView(
                      src:  GetLinks().getKYClink(email, name, site),
                      onLoaded: () {
                        print('loaded');
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

                    )),

              ],
            ),

          ],
        ));
  }


}
