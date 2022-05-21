import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class LeaveIssuePage extends StatelessWidget {

  String leavingDate='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MyTheme.orange2,),
    body: Column(children: [
      Text('Leaving Date'),
      DateTimeFormField(
        dateFormat:DateFormat('yyyy-MM-dd'),
        decoration:
         InputDecoration(
          hintStyle: TextStyle(color: Colors.black),
          errorStyle: TextStyle(color: Colors.redAccent),
          border:  OutlineInputBorder(borderSide: BorderSide(color: MyTheme.orange2)),
          suffixIcon: Icon(Icons.event_note),

          labelText: 'Leaving Date',
        ),
        mode: DateTimeFieldPickerMode.date,
        autovalidateMode: AutovalidateMode.always,
        validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
        onDateSelected: (value) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(value);
          print(formattedDate);
          //leavingDate=value as String;
         leavingDate=formattedDate;
        },
      ),
      RaisedButton(onPressed: (){
        if(leavingDate!=''){
        FirebaseService().leavingDate(leavingDate,context);}},child: Text('Submit'),)
    ],),
    );
  }
}
