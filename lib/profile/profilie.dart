import 'package:pleez/models/product_model.dart';
import 'package:pleez/widget/loading_widget.dart';
import 'package:pleez/widget/result_widget.dart';
import 'package:pleez/widget/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile_page extends StatelessWidget {
  final String ordername;
  final String buyername;
  final String address;
  final String phoneno;
  const Profile_page({
    Key? key,
    required this.buyername,
    required this.ordername,required this.address, required this.phoneno,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,

      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Order Request ",
                      style: TextStyle(color: Colors.black45,
                        fontSize: 27,fontWeight: FontWeight.bold
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 300,
              color: Colors.red,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Buyer name"),
                    Text('john tiwari')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}