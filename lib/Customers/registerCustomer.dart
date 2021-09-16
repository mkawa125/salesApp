import 'package:flutter/material.dart';
import 'package:simusolarApp/HomePages/nav_drawer.dart';
import 'package:simusolarApp/HomePages/bottomNavigation.dart';
import 'package:simusolarApp/StockOnHand/index.dart';
import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/Customers/index.dart';

class RegisterCustomer extends StatefulWidget {
  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    StockOnHand(),
    HomeClass(),
    ListCustomers(),
    // TripsPage(),
    // TicketsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text('Register Customer', style: TextStyle(color: Colors.black87),),
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
      body: new Center(
        child: Text("Register customer page"),
      ),

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
