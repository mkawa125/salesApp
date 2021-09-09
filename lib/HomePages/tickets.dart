import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      body: new Center(
        child: Text("This is the tickets page"),
      ),
    );
  }
}
