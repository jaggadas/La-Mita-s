import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/verified_stream.dart';
import 'package:la_mita_admin/utils/UserModel.dart';
class CustomerDetails extends StatelessWidget {
  CustomerDetails({this.userModel});
  UserModel? userModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Customer Details'),),
    body: Column(children: [
            Text(userModel!.name),
      Text(userModel!.site),
      Text(userModel!.email),
      Text(userModel!.phone),
      SizedBox(height: 10,),
      Text('Payments'),
      VerifiedStream(id: userModel!.id,)

    ],),
    );
  }
}
