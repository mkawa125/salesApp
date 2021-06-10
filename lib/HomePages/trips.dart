import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Trips"),
      ),
      body: new Center(
        child: Text("This is the trips page"),
      ),
    );
  }
}
