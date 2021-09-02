import 'package:flutter/material.dart';
import 'package:simusolarApp/AuthPages/login.dart';
import "nav_drawer.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:simusolarApp/Controllers/api.dart';
import 'dart:developer';



class HomeClass extends StatefulWidget {
  @override
  _HomeClassState createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass>{
  String name;
  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        name = user['first_name'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hi, $name',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: (){
                  logout();
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    // log('data: $body');
    if(body['status'] == 'success'){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>LoginPage()));
    }
  }
}