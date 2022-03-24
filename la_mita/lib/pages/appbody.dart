import 'package:flutter/material.dart';
import 'package:la_mita/pages/below_appbar.dart';
import 'package:la_mita/pages/widgets/themes.dart';

class AppBody extends StatelessWidget {
  const AppBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            below_appbar(),
            Container(
              height: 30,
              child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    "Disco dancer(koi text)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
             ]
              ) 
               ),
               SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 child: Column(children: [
                   optCards(  
                  image: '',
                  title: "KYC Form",
                  product: "any details",
                ),
                 optCards(  
                  image: '',
                  title: "Visitor Entry Form",
                  product: "any details",
                ),
                 optCards(  
                  image: '',
                  title: "Service Request Form",
                  product: "any details",
                ),
                 optCards(  
                  image: '',
                  title: "Payment",
                  product: "any details",
                ),
                 optCards(  
                  image: '',
                  title: "Payment History",
                  product: "any details",
                ),

                   
                 ]),
               )
          ],
          )

     );
  }
}

class optCards extends StatelessWidget {
  const optCards({ Key? key,
   required this.image,
    required this.title,
    required this.product,
   }) : super(key: key);
    final String image, title, product;

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: 50,
          top: 20,
          bottom: 50,
        ),
        width: size.width * 0.8,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Image.asset(image), 
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color:  MyTheme.orange2.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(12) ,
                    topRight: Radius.circular(12),       
               bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        
                     
                        color: MyTheme.orange2.withOpacity(0.5),
                      )
                    ]),

           child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "$title\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "$product".toUpperCase(),
                        style: TextStyle(color: Colors.grey),
                      )
                    ])),
                  
                    
                  ],
                ),         
      
        )
            )]
        ) 
        ); 
  }
}