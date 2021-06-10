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
          Icon(Icons.share_outlined),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search)),
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