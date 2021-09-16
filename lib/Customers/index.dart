import 'package:flutter/material.dart';
import 'package:simusolarApp/HomePages/nav_drawer.dart';
import 'package:simusolarApp/Customers/registerCustomer.dart';
import 'package:simusolarApp/HomePages/slideLeftRoute.dart';
import 'package:simusolarApp/HomePages/slideRightRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListCustomers extends StatefulWidget {
  @override
  _ListCustomersState createState() => _ListCustomersState();
}

class _ListCustomersState extends State<ListCustomers> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: 25,
          itemExtent: 40.0,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: Icon(Icons.account_circle),
              trailing: Text("4 Accounts",
                style: TextStyle(
                    color: Colors.red[300],fontSize: 15),),
              title:Text("Customer Name $index",
                style: TextStyle(
                    color: Colors.grey[700],fontSize: 15),),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){ Navigator.push(context, new MaterialPageRoute(builder: (context) => RegisterCustomer()),);},
        tooltip: 'Add New Lead',
        child: Icon(Icons.add),
      ),
    );
  }
}
