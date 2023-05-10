
// import 'package:amazon_clone/screens/results_screen.dart';
import 'package:pleez/utils/constant.dart';
import 'package:flutter/material.dart';

import '../screen/result_screen.dart';

class CategoriesHorizontalListViewBar extends StatelessWidget {
  const CategoriesHorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(
                      query: categoriesList[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding:
                const EdgeInsets.only(top: 5, left: 25),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CircleAvatar(radius: 20,
                          backgroundImage: AssetImage(
                            categoryLogos[index],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(categoriesList[index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}