import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/constrants.dart';

class site extends StatefulWidget {
  const site({ Key? key }) : super(key: key);

  @override
  State<site> createState() => _siteState();
}

class _siteState extends State<site> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

       backgroundColor: Colors.white,
  appBar: AppBar(
          backgroundColor: MyTheme.orange4,
           title: Text('  site'),
      
    ),
    body: Column(
      children: [ Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0)),
        TextFormField(
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
                         
                        });
                        
                      },
                    ),
        
      ],
    ),
    
    );
  }
}