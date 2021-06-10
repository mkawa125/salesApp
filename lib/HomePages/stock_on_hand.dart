import 'package:flutter/material.dart';

class StockOnHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Stock On Hand"),
      ),
      body: new Center(
        child: Text("This is the stock on hand page"),
      ),
    );
  }
}