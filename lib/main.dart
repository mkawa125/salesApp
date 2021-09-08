import 'dart:math';

import "package:flutter/material.dart";
// import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/HomePages/home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'dart:convert';

/** import new pages */
import 'package:simusolarApp/AuthPages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CheckAuth(),
        // routes: <String,WidgetBuilder>{
        //   '/dashboard' : (BuildContext context) => new Dashboard(title:title),
        //   '/adddata' : (BuildContext context) => new AddData(title:title),
        //   '/register' : (BuildContext context) => new RegisterPage(title:title),
        //   '/login' : (BuildContext context) => new LoginPage(title:title),
        // },
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var user = localStorage.getString('user');
    debugPrint('Token: $token');
    debugPrint('User: $user');
    if(token != null && token != '0'){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      child = LoginPage();
    }
    return Scaffold(
      body: child,
    );
  }
}


// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }
// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     Home(),
//     StockOnHand(),
//     EvaluationPage(),
//     TripsPage(),
//     TicketsPage()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         items: [
//           new BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text('Home'),
//           ),
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             title: new Text('Stock'),
//           ),
//
//
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.fact_check),
//             title: new Text('Evaluation'),
//           ),
//
//           new BottomNavigationBarItem(
//             icon: Icon(Icons.directions_car),
//             title: new Text('Trips'),
//           ),
//
//
//           new BottomNavigationBarItem(
//               icon: Icon(Icons.confirmation_number),
//               title: Text('Tickets')
//           ),
//         ],
//       ),
//     );
//   }
//
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
