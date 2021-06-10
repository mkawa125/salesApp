import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Home Page"),
      ),
      body: new Center(
        child: Text("This is the home page"),
      ),
    );
  }
}