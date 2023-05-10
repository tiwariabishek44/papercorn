
import 'package:pleez/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(height:screenSize.height * 0.6, width: screenSize.width * 0.9
            ,child: Image.asset('assets/john.jpg'),
          decoration: BoxDecoration(
            
          ),),
        ),
      ),
    );
  }
}