import 'package:flutter/material.dart';
import 'package:la_mita_admin/pages/widgets/themes.dart';
import 'package:la_mita_admin/pages/widgets/verified_stream.dart';
import 'package:la_mita_admin/utils/UserModel.dart';
class CustomerDetails extends StatelessWidget {
  CustomerDetails({this.userModel});
  UserModel? userModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Customer Details'), backgroundColor: MyTheme.orange4,),
    body: SingleChildScrollView(
      child: Column(
        children:[ Container( padding: EdgeInsets.fromLTRB(20, 30, 10, 30),
                      decoration: BoxDecoration(
                       /* gradient:  LinearGradient(
                        colors: [MyTheme.orange4, MyTheme.orange2],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1),
                        stops: [0, 1.0],
                      ), */
                          borderRadius: BorderRadius.circular(0),
                          color: Color.fromARGB(255, 63, 61, 61)),
          child: Column(children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(userModel!.name, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), ),
                              Text(userModel!.phone, style: TextStyle(fontSize: 14, color: Colors.white, ))

                            ],
                          ),
                          SizedBox(height: 8,),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(userModel!.email, style: TextStyle(fontSize: 14, color: Colors.white, ), ),
                              Text(userModel!.site, style: TextStyle(fontSize: 14 , color: Colors.white, ))

                            ],
                          ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("leaving date :${userModel!.leavingDate==""?"NIL":userModel!.leavingDate}", style: TextStyle(fontSize: 14, color: Colors.white, ), ),


              ],
            ),

           // VerifiedStream(id: userModel!.id,)
        ],),

        ),
        SizedBox(height: 20,),
        Text('PAYMENTS', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold), ),
       SizedBox(height: 14,),
        VerifiedStream(id: userModel!.id,)
        
          ]  ),

      
    )
    
    );
  }
}
