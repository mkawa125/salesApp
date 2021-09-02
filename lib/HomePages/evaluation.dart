import 'package:flutter/material.dart';
import 'nav_drawer.dart';

class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavDrawer(),
      body: new Center(
        child: Text("This is the evaluation page"),
      ),
    );
  }
}
