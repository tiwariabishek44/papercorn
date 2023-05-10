// import 'package:amazon_clone/screens/results_screen.dart';
// import 'package:amazon_clone/screens/search_screen.dart';
import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
import 'package:flutter/material.dart';

import '../screen/result_screen.dart';
import '../screen/search_screen.dart';
class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
                : Container(),
            SizedBox(
              width: screenSize.width * 0.7,
              child: Container(
         color: Colors.transparent,
                // child: TextField(
                //
                //   readOnly: isReadOnly,
                //   onTap: () {
                //     if (isReadOnly) {
                //       // // Navigator.push(
                //       // //     context,
                //       // //     MaterialPageRoute(
                //       // //         builder: (context) => const SearchScreen())
                //       // );
                //     }
                //   },
                //   decoration: InputDecoration(
                //
                //     fillColor: Colors.transparent,
                //
                //   ),
                // ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none_outlined,color: Colors.transparent,),
            )
          ],
        ),
      ),
    );
  }
}