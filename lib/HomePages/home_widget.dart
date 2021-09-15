// Import material again
import "package:flutter/material.dart";
import 'trips.dart';
import "placeholder_widget.dart";
import 'nav_drawer.dart';
import 'package:simusolarApp/StockOnHand/index.dart';
import 'tickets.dart';
import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/Customers/index.dart';
import 'package:simusolarApp/HomePages/slideLeftRoute.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _HomeState();
    }
  }

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    StockOnHand(),
    HomeClass(),
    ListCustomers(),
    TripsPage(),
    TicketsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text('Sales App',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        shadowColor: Colors.grey[100],
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          Icon(Icons.more_vert,
            color: Colors.black87,
          ),
        ],
        backgroundColor: Colors.grey[100],
      ),
      body: _children[_currentIndex],
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

