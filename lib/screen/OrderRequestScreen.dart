import 'package:pleez/models/order_request.dart';
import 'package:pleez/models/product_model.dart';
import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/profile/landings.dart';
import 'package:pleez/profile/profilie.dart';
import 'package:pleez/providers/user_detail_provider.dart';
import 'package:pleez/screen/sell_screen.dart';
// import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
// import 'package:amazon_clone/widgets/account_screen_app_bar.dart';
import 'package:pleez/widget/costum_mainbutton.dart';
import 'package:pleez/widget/product_show_case.dart';
import 'package:pleez/widget/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/account_screen_app_bar.dart';


class OrderRequestScreen extends StatefulWidget {
  const OrderRequestScreen({Key? key}) : super(key: key);

  @override
  State<OrderRequestScreen> createState() => _OrderRequestScreenState();
}

class _OrderRequestScreenState extends State<OrderRequestScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              IntroductionWidgetAccountScreen(),



              const Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order Requests",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection("orderRequests")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                OrderRequestModel model =
                                OrderRequestModel.getModelFromJson(
                                    json:
                                    snapshot.data!.docs[index].data());
                                return ListTile(
                                  title: Text(
                                    "Order:  ${model.orderName} \n Phone:  ${model.phoneno}\n Buyer name :  ${model.buyersName} \nPrice:${model.afterprice}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20),

                                  ),
                                  subtitle:
                                  Text("Address: ${model.buyersAddress}",style: TextStyle(fontSize: 18),),
                                  trailing: GestureDetector(
                                    onTap: (){},
                                    child: IconButton(
                                        onPressed: () async {
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                              .collection("orderRequests")
                                              .doc(snapshot.data!.docs[index].id)
                                              .delete();
                                        },
                                        icon: Icon(Icons.check)),
                                  ),
                                );
                              });
                        }
                      })
              )
            ],
          ),
        ),
      ),
    );
  }
}


class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.000000000001)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello, ",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22,
                        ),
                      ),


                      TextSpan(
                        text: "${userDetailsModel.Name}",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15 ,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if(userDetailsModel.Name=="Abishek Tiwari ")...[
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
                  ),
                ),
              )
            ]else...[
              Text("A is less than or Equal to 10")
            ]

          ],
        ),
      ),
    );
  }
}