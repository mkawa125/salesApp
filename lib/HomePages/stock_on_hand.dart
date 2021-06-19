import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class StockOnHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Stock on hand'),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: new Center(
        child: Text("This is the stock on hand page"),
      ),
    );
  }
}