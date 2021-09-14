import 'package:flutter/material.dart';
import 'package:simusolarApp/AuthPages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:simusolarApp/Controllers/api.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        children: <Widget>[
          DrawerHeader(
            child: Text('Service App', style: TextStyle(color: Colors.white, fontSize: 18)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/farm.jpeg'),
                    fit: BoxFit.fill,
                ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            hoverColor: Colors.black12,
            onTap: (){
              logout();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>LoginPage()));
            },
          ),
        ],
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
    }
  }
}