import 'package:flutter/material.dart';
import 'package:la_mita/pages/widgets/themes.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
class ProgressDialogService{
  showDialog(String message,BuildContext context){
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: '$message',progressBgColor: MyTheme.orange2,progressValueColor: Colors.grey);
  }
}