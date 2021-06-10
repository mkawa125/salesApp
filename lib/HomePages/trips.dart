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
      appBar: AppBar(
        title: Text('Trips'),
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
        child: Text("This is the trips page"),
      ),
    );
  }
}
