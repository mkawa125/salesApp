import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class TripsPage extends StatefulWidget {
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      body: new Center(
        child: Text("This is the trips page"),
      ),
    );
  }
}
