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
      appBar: AppBar(
        title: Text('Evaluation'),
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
        child: Text("This is the evaluation page"),
      ),
    );
  }
}