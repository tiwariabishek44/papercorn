import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'caddress.dart';
import 'package:pleez/catageory/Books/dashboard.dart';
import 'package:pleez/catageory/Other_items/dashboard.dart';
import 'package:pleez/catageory/gir/gir.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pleez/home_screen/data.dart';
import 'package:pleez/home_screen/detail_screen.dart';
import 'package:pleez/my_colors.dart';

import '../catageory/Copy/dashboard.dart';

class Cart_landing extends StatefulWidget {
  const Cart_landing({Key? key}) : super(key: key);

  @override

  _Cart_landingState createState() => _Cart_landingState();
}

class _Cart_landingState extends State<Cart_landing> {


  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.green.shade300,
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(1)),
            ),
            child: GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child:Address()));

            },
              child: ListTile(

                leading: Text('Delivery'),
                title: Text('chibihil gauri shankar'),
                trailing: Icon(Icons.arrow_downward_outlined),
              ),
            ),
          ),



          const SizedBox(
            height: 10,
          ),
          GridView.count(
            childAspectRatio: 2.6,
            crossAxisCount: 1,
            padding: const EdgeInsets.all(2.0),
            children: Data.generateProducts().map((e) => Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              elevation: 0.5,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: DetailScreen(
                    e.image,
                    e.title,
                    e.type,
                    e.description,
                    e.price,


                  )));
                },
                child: Container( margin: const EdgeInsets.only(left: 6.0, right: 6.0, top: 5.0),

                  child: Row(
                    children: [
                      Image.asset(e.image,height: 90,width: 90,),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.title,style: TextStyle(fontSize: 15),),
                          SizedBox(height: 5,),
                          Text("Rs.\ ${e.price}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),

                  Row(
                    children: [




                      Container(
                        child: Center(child: Text("-",style: TextStyle(fontSize: 23,color: Colors.white,),)),
                        height:26,width: 26,margin:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(6.0)),

                      ),
                      Container(child: Text("1"),


                      ),Container(
                        child: Center(child: Text("+",style: TextStyle(fontSize: 23,color: Colors.white,),)),
                        height:26,width: 26,margin:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(6.0)),

                      ),

                    ],

                          ),


                        ],
                      ),
                      SizedBox(width: 20,),

                      Expanded(
                        child: Container(
                          child: Center(child: Text("Remove",style: TextStyle(fontSize: 19,color: Colors.black54,),)),
                          height:35,width: 80,margin:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(6.0)),

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),).toList(),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          )
        ],
      ),

    );
  }
}