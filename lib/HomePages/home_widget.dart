// Import material again
import "package:flutter/material.dart";

class Home extends StatefulWidget{
  @override

  State<StatefulWidget> createState() {
      return _HomeState();
    }
  }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: new Text('Stock'),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check),
            title: new Text('Evaluation'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: new Text('Trips'),
          ),


          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number),
              title: Text('Tickets')
          )
        ],
      ),
    );
  }
}
