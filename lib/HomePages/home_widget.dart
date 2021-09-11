// Import material again
import "package:flutter/material.dart";
import 'trips.dart';
import "placeholder_widget.dart";
import 'nav_drawer.dart';
import 'stock_on_hand.dart';
import 'tickets.dart';
import 'package:simusolarApp/HomePages/home.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _HomeState();
    }
  }

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeClass(),
    StockOnHand(),
    PlaceholderWidget(Colors.white),
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
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            title: new Text('Me'),
          ),


          // new BottomNavigationBarItem(
          //   icon: Icon(Icons.fact_check),
          //   title: new Text('Evaluation'),
          // ),
          //
          // new BottomNavigationBarItem(
          //   icon: Icon(Icons.directions_car),
          //   title: new Text('Trips'),
          // ),


          new BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number),
              title: Text('Tickets')
          ),
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

