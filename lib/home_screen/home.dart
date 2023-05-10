import 'package:flutter/material.dart';
import 'package:pleez/cart/cartlanding.dart';
import 'package:pleez/profile/landings.dart';
import 'dashboard.dart';


const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  List<Widget>  pages = const[
    DashboardScreen(),
    DashboardScreen(),
    Cart_landing(),
    Profile_Landings(),

  ];

  @override
  Widget build(BuildContext context) {
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
                  selectedIcon: Icon(Icons.notifications),
                  icon: Icon(Icons.notifications_outlined),
                  label: 'Notification'),

              NavigationDestination(
                  selectedIcon: Icon(Icons.shopping_cart),
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.people),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'),

            ],
          ),
        ));
  }
}