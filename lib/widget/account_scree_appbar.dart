import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/providers/user_detail_provider.dart';
import 'package:pleez/screen/search_screen.dart';
import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  AccountScreenAppBar({Key? key})
      : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:Text("Pco", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),)
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("G-cash :",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                    Text('   200'),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}