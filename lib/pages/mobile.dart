import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/utils/constrants.dart';

class mobile extends StatefulWidget {
  const mobile({ Key? key }) : super(key: key);

  @override
  State<mobile> createState() => _mobileState();
}

class _mobileState extends State<mobile> {
   String entered_phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Colors.white,
  appBar: AppBar(
          backgroundColor: MyTheme.orange4,
           title: Text('  Mobile number'),
      
    ),
    body: Column(
      children: [ Padding(padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0)),
        TextFormField(
            keyboardType: TextInputType.number,
                     // inputFormatters: <TextInputFormatter>[
                     //   FilteringTextInputFormatter.digitsOnly
                     // ],
                      cursorColor: MyTheme.orange2,
                      decoration: kInputDecoration,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile Number can not be empty";
                        } else if (value.length <= 9) {
                          return "Mobile Number should be atleast 10 digits";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          entered_phone = value;
                        });
                      },
                    ),
        
      ],
    ),
    
    );
  }
}