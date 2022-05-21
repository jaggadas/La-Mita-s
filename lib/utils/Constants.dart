import 'package:flutter/material.dart';

import '../pages/widgets/themes.dart';

var kInputDecoration=InputDecoration(
  focusColor: MyTheme.orange2,
  hintText: "Enter Mobile Number",
  labelText: "Mobile Number",
  labelStyle: TextStyle(color: MyTheme.orange3),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: MyTheme.orange2)),
);
var kUpiIdValue='7620780585-1@okbizaxis';