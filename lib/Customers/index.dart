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
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: ListView.separated(
          itemCount: 5,
          padding: EdgeInsets.all(0),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[500],
          ),
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: Icon(Icons.account_circle),
              // contentPadding: EdgeInsets.zero,
              trailing: Text("4 Accounts",
                style: TextStyle(
                    color: Colors.grey[700],fontSize: 13),),
              title:Text("Customer Name $index",
                style: TextStyle(
                    color: Colors.grey[900],fontSize: 13),),
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
