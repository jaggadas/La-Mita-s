import 'dart:html';

import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/toast.dart';
import 'package:la_mita/utils/routes.dart';
import 'package:la_mita/UiFake.dart' if (dart.library.html) 'dart:ui' as ui;

import 'dart:html' as html;



class Webpayment extends StatelessWidget{
  final String? name;
  final String? image;
  final String? price;
  Webpayment({this.name,this.price,this.image});
  @override
  Widget build(BuildContext context) {
    //register view factory
    ui.platformViewRegistry.registerViewFactory("rzp-html",(int viewId) {
      IFrameElement element=IFrameElement();
//Event Listener
      window.onMessage.forEach((element) {
        print('Event Received in callback: ${element.data}');
        if(element.data=='MODAL_CLOSED'){
          Navigator.pop(context);
        }else if(element.data=='SUCCESS'){
          print('PAYMENT SUCCESSFULL!!!!!!!');
          FlutterToastService().showToast('Payment Successfull');
          Navigator.popAndPushNamed(context, MyRoutes.paymentRoute);

        }
      });

      //element.requestFullscreen();
      //element.src='assets/payments.html?name=$name&price=$price&image=$image';
      element.srcdoc = '<html><p><meta name="viewport" content="width=device-width"><head><title>RazorPay Web Payment</title></head><body><script src="https://checkout.razorpay.com/v1/checkout.js"></script><script>var options = { config:{},"key": "rzp_test_uC3ZnPLYZDPxSI","amount": "$price", "currency": "INR","name": "La Mita\'s","description": "$name","image": "$image","handler": function (response){window.parent.postMessage("SUCCESS","*");},"prefill": {"name": "","email": "","contact": ""},config: {display: {hide: [{ method: "netbanking" },{ method: "card" },{ method: "wallet" },{ method: "paylater" },{ method: "emi" },] } },"notes": {"address": "Autofy" },"theme": {"color": "#F56032"},"modal": {"ondismiss": function(){window.parent.postMessage("MODAL_CLOSED","*");}}}; var rzp1 = new Razorpay(options);window.onload = function(e){rzp1.open();e.preventDefault();}</script></body></p></html>';
      element.style.border = 'none';
      return element;
    });
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            child: HtmlElementView(viewType: 'rzp-html'),
          );
        }));
  }

}