import 'package:flutter/material.dart';
import 'package:pleez/cart/cartlanding.dart';
import 'package:pleez/profile/landings.dart';
import 'package:pleez/providers/user_detail_provider.dart';
import 'package:pleez/resources/cloudfirestore_method.dart';
import 'package:pleez/screen/account_screen.dart';
import 'package:pleez/screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../screen/cart_screen.dart';



const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);


class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _currentIndex = 0;
  List<Widget>  pages = const[
    HomeScreen(),
    AccountScreen(),

    Profile_Landings(),

  ];
  @override
  void initState(){
    super.initState();
    CloudFirestoreClass().getNameAndAddress();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getData();
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.white,


          body: Center(
            child: pages [_currentIndex],
          ),

          bottomNavigationBar: NavigationBar(backgroundColor: Colors.white,

            selectedIndex: _currentIndex,
            onDestinationSelected: (int newIndex){
              setState(() {
                _currentIndex = newIndex;
              });
            },
            destinations: [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon:  Icon(Icons.home_outlined),
                  label: 'Home'),

              NavigationDestination(
                  selectedIcon: Icon(Icons.reorder),
                  icon: Icon(Icons.reorder),
                  label: 'Orders'),



              NavigationDestination(
                  selectedIcon: Icon(Icons.people),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'),

            ],
          ),
        ));
  }
}