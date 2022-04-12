import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/progress_dialog.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/FirebaseConstants.dart';
import 'package:la_mita_admin/utils/PaymentObject.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../easy_web_view.dart';
import '../services/Firebase.dart';
import '../services/GetLinks.dart';
class GoogleFormPage extends StatefulWidget {
  var payObj,index;
  GoogleFormPage({this.payObj,this.index});
  @override
  _GoogleFormPageState createState() => _GoogleFormPageState();
}

class _GoogleFormPageState extends State<GoogleFormPage> {



  static ValueKey key = ValueKey('key_0');
  bool _isHtml = false;
  bool _blockNavigation = false;
  bool _isMarkdown = false;
  bool _useWidgets = false;
  bool _isSelectable = false;
  bool open = false;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    String name=widget.payObj.user_name;
    String email=widget.payObj.email;
    String site=widget.payObj.site;
    String date=widget.payObj.date;
    String type=widget.payObj.payment_type;
    String month=widget.payObj.payment_month;
    String year=widget.payObj.payment_year;
    String mode=widget.payObj.payment_mode;
    String amount=widget.payObj.payment_amount;
    String remarks=widget.payObj.payment_remarks;
    ProgressDialog pu=ProgressDialog(context: context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Verify Payments"),
          backgroundColor: MyTheme.orange2,
          actions: [
            IconButton(onPressed: ()async{
              await FirebaseService().verifyPayment(widget.index, widget.payObj, context, kAccepted);
              Navigator.pop(context);
            }, icon: Icon(Icons.done,color: Colors.green,)),
            IconButton(onPressed: ()async{
              await FirebaseService().verifyPayment(widget.index, widget.payObj, context, kRejected);
              Navigator.pop(context);
            }, icon: Icon(Icons.close,color: Colors.red,))

          ],


        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child:WebView(
                      initialUrl:GetLinks().getGoogleFormLink(name, email, site, date, type, month, year, mode, amount, remarks),
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                      },
                      onProgress: (int progress) {
                        print('WebView is loading (progress : $progress%)');
                        if(progress==100){
                          pu.close();
                        }
                      },
                      onPageStarted: (String url) {
                        pu.show(max: 100, msg: 'Please Wait',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
                        print('Page started loading: $url');
                      },
                      onPageFinished: (String url) {
                        print('Page finished loading: $url');
                        pu.close()  ;
                      },
                      gestureNavigationEnabled: true,
                      backgroundColor: const Color(0x00000000),
                    ),
                ),

              ],
            ),

          ],
        ));
  }


}
