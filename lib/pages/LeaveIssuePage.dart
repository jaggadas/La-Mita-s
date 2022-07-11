import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:la_mita/services/Firebase.dart';
import 'package:la_mita/utils/Constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class LeaveIssuePage extends StatefulWidget {

  @override
  State<LeaveIssuePage> createState() => _LeaveIssuePageState();

}

class _LeaveIssuePageState extends State<LeaveIssuePage> {
  String leavingDate='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDetails();
  }
  updateDetails()async{
    leavingDate= await FirebaseService().getLeavingDate();
    setState(() {
      leavingDate;
    });
  }
  @override
  Widget build(BuildContext context) {
    FirebaseService().autoReturnToHomePage(context);

    return Scaffold(appBar: AppBar(title: Text('Issue leave date'),backgroundColor: MyTheme.orange2,),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
        Text("Current Leaving Date :$leavingDate"),
        SizedBox(height: 2,),
        DateTimeFormField(
          dateFormat:DateFormat('yyyy-MM-dd'),
          decoration:
           InputDecoration(
            hintStyle: TextStyle(color: Colors.black),
            errorStyle: TextStyle(color: Colors.redAccent),
            border:  OutlineInputBorder(borderSide: BorderSide(color: MyTheme.orange2),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyTheme.orange2),),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: MyTheme.orange2),),
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
        SizedBox(height: 10,),
        TextButton(onPressed: (){if(leavingDate!=''){

          FirebaseService().leavingDate(leavingDate,context);
          updateDetails();
        }

        },
          style: ButtonStyle(
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor:
            MaterialStateProperty.all<Color>(MyTheme.orange4),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),child: Text('Submit'),),

      ],),
    ),
    );
  }
}
