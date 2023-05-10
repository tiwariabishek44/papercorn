import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pleez/home_screen/data.dart';
import 'package:pleez/home_screen/detail_screen.dart';
import 'package:pleez/my_colors.dart';

class Girls extends StatefulWidget {
  const Girls({Key? key}) : super(key: key);

  @override
  _GirlsState createState() =>_GirlsState ();
}

class _GirlsState extends State<Girls> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gir",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [



          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                  text: "All Product",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            childAspectRatio: 0.85,
            crossAxisCount: 2,
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
                child: Container(
                  margin: const EdgeInsets.only(left: 6.0, right: 6.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(e.image,height: 100,width: double.infinity,),
                      const SizedBox(height: 13,),


                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: e.title,
                            style: const TextStyle(fontFamily: 'RobotoMono',
                                color: Colors.black87,fontWeight: FontWeight.w600,
                                fontSize: 15.0)),
                      ),
                      SizedBox(height: 3,),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: e.type,
                            style: const TextStyle(
                                color: Colors.black87,fontFamily: 'RobotoMono',
                                fontSize: 15.0)),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: "Rs.\ ${e.price}",
                                style: const TextStyle(fontFamily: 'RobotoMono',
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 17.0)),
                          ),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 10,),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "X-Cash.\ ${e.price},",
                            style: const TextStyle(
                                color: Colors.green,fontFamily: 'RobotoMono',
                                fontSize: 15.0)),
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