import 'package:flutter/material.dart';

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
            leading: Icon(Icons.fact_check_outlined),
            title: Text('All Applications'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.money_outlined),
            title: Text('All Orders'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.drive_eta_outlined),
            title: Text('Cars'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text('Live Applications'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.local_grocery_store_outlined),
            title: Text('Products'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text('Pump Characteristics'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.list_outlined),
            title: Text('Sold Stock'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text('Stock On Hand'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text('Stock Transfer History'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.info_outlined),
            title: Text('About'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text('Feedback'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            hoverColor: Colors.black12,
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}