import 'package:flutter/material.dart';
import "package:simusolarApp/HomePages/nav_drawer.dart";

class StockOnHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      body: new Center(
        child: Text("This is the stock on hand index page"),
      ),
    );
  }
}