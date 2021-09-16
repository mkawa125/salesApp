import 'package:flutter/material.dart';
import 'package:simusolarApp/StockOnHand/index.dart';
import 'tickets.dart';
import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/Customers/index.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    StockOnHand(),
    HomeClass(),
    ListCustomers(),
    // TripsPage(),
    TicketsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        // onTap: (value){
        //   if(value == 2){Navigator.push(context, SlideLeftRoute(page: ListCustomers(),),);}
        //   },
        currentIndex: _currentIndex,
        items: [

          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            title: new Text('Stock'),
          ),

          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),

          new BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_sharp),
            title: new Text('Customers'),
          ),

          // new BottomNavigationBarItem(
          //   icon: Icon(Icons.directions_car),
          //   title: new Text('Trips'),
          // ),


          // new BottomNavigationBarItem(
          //     icon: Icon(Icons.confirmation_number),
          //     title: Text('Tickets')
          // ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
