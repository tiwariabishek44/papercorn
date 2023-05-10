// import 'dart:ui';
//
// import 'package:PaperCorner/models/product_model.dart';
// import 'package:PaperCorner/models/user_details_model.dart';
// import 'package:PaperCorner/providers/user_detail_provider.dart';
// import 'package:PaperCorner/resources/cloudfirestore_method.dart';
// import 'package:PaperCorner/screen/PaymentPage.dart';
// import 'package:PaperCorner/utils/color_themes.dart';
// import 'package:PaperCorner/utils/constant.dart';
// import 'package:PaperCorner/utils/utils.dart';
// import 'package:PaperCorner/widget/account_scree_appbar.dart';
// // import 'package:getxx/widget/cart_item_widget.dart';
// import 'package:PaperCorner/widget/costum_mainbutton.dart';
// import 'package:PaperCorner/widget/search_bar_widget.dart';
// import 'package:PaperCorner/widget/user_detail_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../widget/apbar.dart';
// import '../widget/cart_ite.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AccountScreenAppBar(),
//
//
//
//
//
//
//
//       body: Center(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 const SizedBox(
//                   height: kAppBarHeight / 2,
//                 ),
//
//
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: StreamBuilder(
//                       stream: FirebaseFirestore.instance
//                           .collection("users")
//                           .doc(FirebaseAuth.instance.currentUser!.uid)
//                           .collection("cart")
//                           .snapshots(),
//                       builder: (context,
//                           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                           snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CustomMainButton(
//                               child: const Text(
//                                 "Loading",
//                               ),
//                               color: yellowColor,
//                               isLoading: true,
//                               onPressed: () {});
//                         } else {
//                           return CustomMainButton(
//                               child: Text(
//                                 "Proceed to buy (${snapshot.data!.docs.length}) items",
//                                 style: const TextStyle(color: Colors.black, fontSize: 11),
//                               ),
//                               color: yellowColor,
//                               isLoading: false,
//                               onPressed: () async {
//
//                                 Navigator.push(context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>  Payment(),
//
//                                               )
//                                           );
//
//
//                                 // await CloudFirestoreClass().buyAllItemsInCart(
//                                 //     userDetails:
//                                 //     Provider.of<UserDetailsProvider>(
//                                 //         context,
//                                 //         listen: false)
//                                 //         .userDetails);
//                                 // Utils().showSnackBar(
//                                 //     context: context, content: "Done");
//                               });
//                         }
//                       },
//                     )),
//                 Expanded(
//                     child: StreamBuilder(
//                       stream: FirebaseFirestore.instance
//                           .collection("users")
//                           .doc(FirebaseAuth.instance.currentUser!.uid)
//                           .collection("cart")
//                           .snapshots(),
//                       builder: (context,
//                           AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                           snapshot) {
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return Container(
//
//
//
//                           );
//                         } else {
//                           return ListView.builder(
//                               itemCount: snapshot.data!.docs.length,
//                               itemBuilder: (context, index) {
//                                 ProductModel model = ProductModel.getModelFromJson(
//                                     json: snapshot.data!.docs[index].data());
//
//
//                                 return CartItemWidget(product: model);
//                               });
//                         }
//                       },
//                     ))
//               ],
//             ),
//             UserDetailsBar(
//               offset: 0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
