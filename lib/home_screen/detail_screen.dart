
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:pleez/home_screen/data.dart';
import 'package:pleez/my_colors.dart';

class DetailScreen extends StatefulWidget {

  final String image;
  final String title;
  final String type;
  final String description;
  final double price;




  const DetailScreen(this.image,this.title,this.type,this.description,this.price,);




  @override
  _DashboardScreenState createState() => _DashboardScreenState();

}

class _DashboardScreenState extends State<DetailScreen> {

  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = false;
  int rotationCount = 22;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  bool imagePrecached = true;


  @override






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,

        backgroundColor: Colors.white,
        elevation: 0,

      ),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.width - 100,
                child:Image.asset(widget.image),
              ),
              Container(
                  width: size.width,
                  decoration: new BoxDecoration(
                      color: MyColors.grayBackground,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: widget.title +  "  "+widget.type,
                              style: const TextStyle(fontFamily: 'RobotoMono',
                                  color: Colors.black87,
                                  fontSize: 17.0)),
                        ),
                        SizedBox(height: 3,),

                        const SizedBox(height: 7,),
                        Row(
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: "Rs.",
                                  style: const TextStyle(fontFamily: 'RobotoMono',
                                      color: Colors.black,
                                      fontSize: 16.0)),
                            ),
                            SizedBox(width: 7,),


                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: "\ ${widget.price}",
                                  style: const TextStyle(fontFamily: 'RobotoMono',
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 20.0)),
                            ),

                          ],
                        ),
                        SizedBox(height: 7,),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: "X-Cash\ ${widget.price},",
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.green,fontFamily: 'RobotoMono',
                                  fontSize: 17.0)),
                        ),
                        SizedBox(height: 17,),

                        Row(
                          children: [
                            Text("Quantity"),
                            SizedBox(width: 20,),



                            Container(
                              child: Center(child: Text("-",style: TextStyle(fontSize: 23,color: Colors.white,),)),
                              height:30,width: 30,margin:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10.0)),

                            ),
                            Container(child: Text("1"),


                            ),Container(
                              child: Center(child: Text("+",style: TextStyle(fontSize: 23,color: Colors.white,),)),
                              height:30,width: 30,margin:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10.0)),

                            ),

                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Product Details", style: TextStyle(fontSize: 20,color: Colors.black),),
                        SizedBox(height: 29,),

                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: widget.description,
                              style: const TextStyle(
                                  color: Colors.black,fontFamily: 'RobotoMono',
                                  fontSize: 15.0)),
                        ),
                        SizedBox(height: 10,),





                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(height: 60,decoration: BoxDecoration(
        border: Border(

          top: BorderSide( //                    <--- top side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0xffffffff),
          blurRadius: 6,
        ),
      ],),
        child: Row(
          children: [
            Container(height: 60,
              child: Icon(Icons.shopping_cart_checkout,color: Colors.white,),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green,),
              margin: EdgeInsets.symmetric(horizontal: 9,vertical: 8),
              width: 80,

            ),

            Container(height: 60,
              child: Center(child: Text("Buy Now",style: TextStyle(fontSize: 18,color: Colors.white),)),

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orangeAccent,),
              margin: EdgeInsets.symmetric(horizontal: 2,vertical: 8),
              width: 120,),

            Container(height: 60,
              child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18),)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
              margin: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
              width:150,)

          ],
        )
      ),
    );
  }
}