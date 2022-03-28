import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
class ProgressDialogService{
  late ProgressDialog pd;
  showDialog(String message,BuildContext context){
    pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: '$message',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  }
  closeDialog(){
    pd.close();
  }
}