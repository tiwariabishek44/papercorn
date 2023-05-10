import 'package:pleez/models/order_request.dart';
import 'package:pleez/models/product_model.dart';
import 'package:pleez/models/user_details_model.dart';
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


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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


              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orders")
                      .get(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      List<Widget> children = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        ProductModel model = ProductModel.getModelFromJson(
                            json: snapshot.data!.docs[i].data());
                        children.add(SimpleProductWidget(productModel: model));
                      }
                      return ProductsShowcaseListView(
                          title: "Your orders", children: children);
                    }
                  }),

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
              Text("")
            ]

          ],
        ),
      ),
    );
  }
}