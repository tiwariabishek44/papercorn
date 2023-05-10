import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pleez/catageory/Books/dashboard.dart';
import 'package:pleez/catageory/Other_items/dashboard.dart';
import 'package:pleez/catageory/gir/gir.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pleez/home_screen/data.dart';
import 'package:pleez/home_screen/detail_screen.dart';
import 'package:pleez/my_colors.dart';

import '../catageory/Copy/dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> buildCategories() {
    return Data.generateCategories()
        .map(
          (e) => Container(
        padding: const EdgeInsets.only(left: 15, bottom: 10),
        child: ElevatedButton(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: MyColors.grayBackground,
                    child: Image.asset(
                      e.image,
                      height: 40,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(e.title, style: const TextStyle(fontSize: 14)),
              ],
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    e.id == 1 ? Colors.black : Colors.black38),
                backgroundColor: MaterialStateProperty.all<Color>(
                    e.id == 1 ? Colors.white : Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
            onPressed: () {}),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Shop X",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [Image.asset("assets/ic_search.png")],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/img_banner.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: "New Release",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            text: "Nike Air\nMax 90",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 28),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                            child: Text("  Buy now  ".toUpperCase(),
                                style: const TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    MyColors.myBlack),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(30)))),
                            onPressed: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Categories",style: TextStyle(fontSize: 23, ),),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
              height: 100.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Copy()));
                  },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Copy",style: TextStyle(fontSize: 20,color: Colors.black),)),
                      width: 100.0,
                    ),
                  ),
                  GestureDetector(onTap: (){
                    // Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Books()));
                  },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Books",style: TextStyle(fontSize: 20,color: Colors.black),)),
                      width: 100.0,
                    ),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Otheritems()));
                  },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Other Items",style: TextStyle(fontSize: 18,color: Colors.black),)),
                      width: 100.0,
                    ),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Girls()));
                  },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("gir",style: TextStyle(fontSize: 20,color: Colors.black),)),
                      width: 100.0,
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 10,
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

                          ],
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