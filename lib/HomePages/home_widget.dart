// Import material again
import "package:flutter/material.dart";
import 'trips.dart';
import "placeholder_widget.dart";
import 'nav_drawer.dart';
import 'stock_on_hand.dart';
import 'tickets.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _HomeState();
    }
  }

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
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
        title: Text('Service App'),
        actions: [
          Icon(Icons.share_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search)),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: new Text('Stock'),
          ),


          new BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            title: new Text('Evaluation'),
          ),

          new BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: new Text('Trips'),
          ),


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

