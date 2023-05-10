
import 'package:pleez/models/product_model.dart';
import 'package:pleez/models/review_model.dart';
import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/providers/user_detail_provider.dart';
import 'package:pleez/resources/cloudfirestore_method.dart';
import 'package:pleez/screen/cart_screen.dart';
import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
// import 'package:getxx/widget/cost_widget.dart';
import 'package:pleez/widget/costum_mainbutton.dart';
// import 'package:getxx/widgets/custom_simple_rounded_button.dart';
// import 'package:amazon_clone/widgets/rating_star_widget.dart';
// import 'package:amazon_clone/widgets/review_dialog.dart';
// import 'package:amazon_clone/widgets/review_widget.dart';
import 'package:pleez/widget/search_bar_widget.dart';
import 'package:pleez/widget/user_detail_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/cost_widget.dart';
import 'PaymentPage.dart';

class ProductScreen extends StatefulWidget {

 final ProductModel productModel;

  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),

        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    widget.productModel.url
                                ),
                              ),
                            ),
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),

                            ),
                          ),
                          spaceThingy,
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [



                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      Text(widget.productModel.productName,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),

                                      CostWidget(
                                          color: Colors.black,
                                          cost: widget.productModel.cost),



                                    ],
                                  ),
                                ),
                                // RatingStatWidget(
                                //     rating: widget.productModel.rating),
                              ],
                            ),
                          ),

                          spaceThingy,

                          GestureDetector(
                            onTap: () async{
                              await CloudFirestoreClass().addProductToCart(
                                            productModel: widget.productModel);


                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Payment(cost: "${widget.productModel.cost}",
                                          gcash: "${widget.productModel.gcash}",
                                            aftercash: "${widget.productModel.aftercash}",)));
                            },
                            child: Center(child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.orange,),
                              height: 40 ,
                                width:screenSize.width * 0.5,
                              child: Center(child: Text("Buy now",style: TextStyle(color: Colors.black,fontSize: 15),)),

                            ),),
                          ),

                          // CustomMainButton(
                          //     child: const Text(
                          //       "Buy Now",
                          //       style: TextStyle(color: Colors.black),
                          //     ),
                          //     color: Colors.orange,
                          //     isLoading: false,
                          //     onPressed: () async {
                          //
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   Payment(cost: ,
                          //                   dc:"2020",)));
                          //       // await CloudFirestoreClass().addProductToOrders(
                          //       //     model: widget.productModel,
                          //       //     userDetails:
                          //       //     Provider.of<UserDetailsProvider>(
                          //       //         context,
                          //       //         listen: false)
                          //       //         .userDetails);
                          //       // Utils().showSnackBar(
                          //       //     context: context, content: "Done");
                          //     }
                          //
                          //     ),
                          spaceThingy,
                          // CustomMainButton(
                          //     child: const Text(
                          //       "Add to cart",
                          //       style: TextStyle(color: Colors.black),
                          //     ),
                          //     color: yellowColor,
                          //     isLoading: false,
                          //     onPressed: () async {
                          //       await CloudFirestoreClass().addProductToCart(
                          //           productModel: widget.productModel);
                          //       Utils().showSnackBar(
                          //           context: context,
                          //           content: "Added to cart.");
                          //     }),
                          spaceThingy,
                          ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const UserDetailsBar(
              offset: 0,
            )
          ],
        ),
      ),
    );
  }
}