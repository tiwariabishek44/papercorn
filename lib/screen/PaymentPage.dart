import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_detail_provider.dart';
import '../resources/cloudfirestore_method.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';
import '../widget/costum_mainbutton.dart';
import '../widget/search_bar_widget.dart';


class Payment extends StatefulWidget {
  final String cost;
  final String gcash;
  final String aftercash;
  const Payment({
    Key? key,
    required this.cost,
    required this.gcash,
    required this.aftercash,
  }) : super(key: key);



  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  SearchBarWidget(
        hasBackButton: true,
        isReadOnly: false,
      ),
      body: ListView(
        children: [



          Container(margin: EdgeInsets.all(10),
            height: 210,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.white70),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Payment:",style: TextStyle(fontSize: 16,color: Colors.red),),
                    SizedBox(width: 10,),
                    Text(widget.cost)

                  ],
                ),
                SizedBox(height: 9,),


                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Used G-cash:",style: TextStyle(fontSize: 16,color: Colors.red),),
                    SizedBox(width: 10,),
                    Text(widget.gcash)


                  ],
                ),
                SizedBox(height: 8,),




                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery charge : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                    Text("Rs .0 ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                  ],
                ),
                SizedBox(height: 8,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Time : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                    Text("1-2days ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  ],
                ),
                SizedBox(height: 8,),


                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount : ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                    Text(widget.aftercash,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),



          Container(

            height: 310,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.white70),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Method",style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0,bottom: 16),
                    child: CircleAvatar(
                      radius: 72.0,

                      backgroundImage: AssetImage('assets/cashon.jpg'),
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("cart")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomMainButton(
                                child: const Text(
                                  "Loading",
                                ),
                                color: yellowColor,
                                isLoading: true,
                                onPressed: () {});
                          } else {
                            return CustomMainButton(
                                child: Text(
                                  "Buy items",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: false,
                                onPressed: () async {

                                  await CloudFirestoreClass().buyAllItemsInCart(
                                      userDetails:
                                      Provider.of<UserDetailsProvider>(
                                          context,
                                          listen: false)
                                          .userDetails);
                                  Utils().showSnackBar(
                                      context: context, content: "Done");
                                  Navigator.pop(context);
                                });
                          }
                        },
                      )),
                ],
              ),
            ),
          ),











        ],
      ),

    );
  }
}







