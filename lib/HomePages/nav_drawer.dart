import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Service App', style: TextStyle(color: Colors.white, fontSize: 18)),
            decoration: BoxDecoration(
                color: Colors.black54,
                image: DecorationImage(
                    image: AssetImage('assets/images/farm.jpeg'),
                    fit: BoxFit.fill,
                ),
            ),
              // margin: EdgeInsets.all(0.0),
              // padding: EdgeInsets.all(0.0),


          ),
          ListTile(
            leading: Icon(Icons.fact_check_outlined),
            title: Text('All Applications'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.money_outlined),
            title: Text('All Orders'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.drive_eta_outlined),
            title: Text('Cars'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text('Live Applications'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.local_grocery_store_outlined),
            title: Text('Products'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text('Pump Characteristics'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text('Sold Stock'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text('Stock On Hand'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text('Stock Transfer History'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.info_outlined),
            title: Text('About'),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}