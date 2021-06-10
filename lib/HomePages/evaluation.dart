import 'package:flutter/material.dart';

class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Evaluations"),
      ),
      body: new Center(
        child: Text("This is the evaluation page"),
      ),
    );
  }
}
