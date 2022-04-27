import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:la_mita_admin/pages/widgets/mobile_number_stream.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/pages/widgets/toast.dart';
import 'package:la_mita_admin/services/Firebase.dart';
import 'package:la_mita_admin/utils/constrants.dart';

class mobile extends StatefulWidget {
  const mobile({ Key? key }) : super(key: key);

  @override
  State<mobile> createState() => _mobileState();
}

class _mobileState extends State<mobile> {
   String entered_phone='';
   var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       backgroundColor: Colors.white,
  appBar: AppBar(
          backgroundColor: MyTheme.orange4,
           title: Text('Add Mobile number'),
      
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0),
            child: TextFormField(
              controller: phoneController,
                keyboardType: TextInputType.number,
                         // inputFormatters: <TextInputFormatter>[
                         //   FilteringTextInputFormatter.digitsOnly
                         // ],
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
                          cursorColor: MyTheme.orange2,
                          decoration: kInputDecoration.copyWith(hintText: 'Enter number without country code'),
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
              if(entered_phone.length==10){
              await FirebaseService().addPhoneNumber(entered_phone,context);
              phoneController.text='';
              }
              else{
                FlutterToastService().showToast('Invalid Number');
              }
            },
            child: Text('Submit'),
          )
          ,
          SizedBox(height: 10,),
          MobileNumberStream()
        ],
      ),
    ),
    
    );
  }
}