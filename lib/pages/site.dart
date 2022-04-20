import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/site_stream.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/pages/widgets/toast.dart';
import 'package:la_mita_admin/utils/constrants.dart';

import '../services/Firebase.dart';

class site extends StatefulWidget {
  const site({ Key? key }) : super(key: key);

  @override
  State<site> createState() => _siteState();
}

class _siteState extends State<site> {
  String entered_site='';
  var siteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

       backgroundColor: Colors.white,
  appBar: AppBar(
          backgroundColor: MyTheme.orange4,
           title: Text('Add Site'),
      
    ),
    body: Column(
      children: [
        Padding(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0),
          child: TextFormField(
            controller:siteController ,
              keyboardType: TextInputType.text,
                       // inputFormatters: <TextInputFormatter>[
                       //   FilteringTextInputFormatter.digitsOnly
                       // ],
                        cursorColor: MyTheme.orange2,
                        decoration: kInputDecoration.copyWith(hintText: "Enter Site",
                         labelText: "Site",),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "site can not be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            entered_site=value;
                            print(entered_site);
                          });

                        },
                      ),
        ),
        TextButton(

          style: ButtonStyle(

            alignment: Alignment.center,

            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor:
            MaterialStateProperty.all<Color>(MyTheme.orange4),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () async{
            print(entered_site);

            if(entered_site!=''){
              await FirebaseService().addSite(entered_site,context);
            siteController.text='';
            }
            else{
              FlutterToastService().showToast('Invalid Name');
            }
          },
          child: Text('Submit'),
        ),
        SizedBox(height: 10,),
        SiteStream()
        
      ],
    ),
    
    );
  }
}