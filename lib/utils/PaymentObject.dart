import 'package:flutter/material.dart';
import 'package:la_mita/utils/FirebaseConstants.dart';
class PaymentObject{
  String date;
  String payment_amount;
  String payment_mode;
  String payment_month;
  String payment_remarks;
  String payment_type;
  String payment_year;
  String user_id;
  String user_name;
  String site;
  String email;
  String phone_number;

  PaymentObject(this.date,this.payment_amount, this.payment_mode,this.payment_month,this.payment_remarks,this.payment_type,this.payment_year,this.user_id,this.user_name,this.site,this.email,this.phone_number);

  factory PaymentObject.fromJson(dynamic json) {
    return PaymentObject(json[kPaymentDate] as String, json[kPaymentAmount] as String,json[kPaymentMode] as String,
    json[kPaymentMonth]as String, json[kPaymentRemarks] as String,json[kPaymentType] as String,
      json[kPaymentYear] as String,
      json[kUserId] as String,
      json[kUserName] as String,json[kSite] as String ,json[kEmail] as String,json[kPhone] as String
    );
  }
  @override
  String toString() {
    return '{ ${this.user_name}, ${this.payment_year} }';
  }
}