import 'package:flutter/material.dart';
import 'package:flutter_application_11/screens/home.dart';
import 'package:flutter_application_11/screens/new_food.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/details.dart';

import 'package:flutter_application_11/screens/order.dart';

class NavigatorHome extends StatefulWidget {
  const NavigatorHome({super.key});

  @override
  State<NavigatorHome> createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorHome> {
  int navIndex = 0;
  final _pages = [ const Homepage(), const Orderpage(),Newfood() , const Details()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (int newIndex) {
          setState(() {
            navIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
        items:  const [
          BottomNavigationBarItem( label: 'Home',
              icon: Icon(Icons.home),
             
            ),
          BottomNavigationBarItem( label: 'Orders',
              icon: Icon(Icons.shopping_cart_sharp),
           ),BottomNavigationBarItem(label: 'New Food',icon: Icon(Icons.fiber_new))

         , BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Details'),
        
        ],
        selectedItemColor: Colors.blue,unselectedItemColor: Colors.black,
      ),
    );
  }
}
