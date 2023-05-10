import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
import 'package:flutter/material.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({Key? key}) : super(key: key);

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  int currentAd = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double smallAdDimension = screenSize.width / 5;
    //Image and gradient
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onHorizontalDragEnd: (_) {
                if (currentAd == largeAds.length - 1) {
                  setState(() {
                    currentAd = 0;
                  });
                } else {
                  setState(() {
                    currentAd++;
                  });
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Image.asset('assets/refer.PNG'),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     width: screenSize.width,
            //     height: screenSize.height / 8,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           backgroundColor,
            //           backgroundColor.withOpacity(0.000001)
            //         ],
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        // Container(
        //   height: 100,
        //   width: screenSize.width,
        //   color: backgroundColor,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //
        //
        //     ],
        //   ),
        // )
      ],
    );
  }


}