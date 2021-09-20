import 'package:flutter/material.dart';
import 'package:simusolarApp/HomePages/nav_drawer.dart';
import 'package:simusolarApp/HomePages/bottomNavigation.dart';
import 'package:simusolarApp/StockOnHand/index.dart';
import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/Customers/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simusolarApp/Customers/index.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:simusolarApp/Controllers/api.dart';

class RegisterCustomer extends StatefulWidget {
  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  int _currentIndex = 2;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var fname;
  var lname;
  var phone;
  final List<Widget> _children = [
    StockOnHand(),
    HomeClass(),
    ListCustomers(),
    // TripsPage(),
    // TicketsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text('Register Customer', style: TextStyle(color: Colors.black87),),
        shadowColor: Colors.grey[100],
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          Icon(Icons.more_vert,
            color: Colors.black87,
          ),
        ],
        backgroundColor: Colors.grey[100],
      ),

      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 24,
                  right: MediaQuery.of(context).size.width * .15,
                  left: MediaQuery.of(context).size.width * .15,
                ),
                child: Center(
                  child: Text("Add Customer Details",
                    style: GoogleFonts.sourceCodePro(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800]
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 2.0,
                color: Colors.white,
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                                size: 15,
                              ),
                              hintText: "Email",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (emailValue) {
                              if (emailValue.isEmpty) {
                                return 'Please enter email';
                              }
                              email = emailValue;
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.insert_emoticon,
                                color: Colors.grey,
                              ),
                              hintText: "First Name",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (firstName) {
                              if (firstName.isEmpty) {
                                return 'Please enter your first name';
                              }
                              fname = firstName;
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.insert_emoticon,
                                color: Colors.grey,
                              ),
                              hintText: "Last Name",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (lastname) {
                              if (lastname.isEmpty) {
                                return 'Please enter your last name';
                              }
                              lname = lastname;
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              hintText: "Phone",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (phonenumber) {
                              if (phonenumber.isEmpty) {
                                return 'Please enter phone number';
                              }
                              phone = phonenumber;
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              hintText: "Phone",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (phonenumber) {
                              if (phonenumber.isEmpty) {
                                return 'Please enter phone number';
                              }
                              phone = phonenumber;
                              return null;
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              hintText: "Phone",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (phonenumber) {
                              if (phonenumber.isEmpty) {
                                return 'Please enter phone number';
                              }
                              phone = phonenumber;
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xFF000000)),
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              hintText: "Phone",
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            validator: (phonenumber) {
                              if (phonenumber.isEmpty) {
                                return 'Please enter phone number';
                              }
                              phone = phonenumber;
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: FlatButton(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                _isLoading? 'Processing...' : 'Save',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            color: Colors.grey[900],
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            disabledColor: Colors.grey,
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(8)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _register();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [

          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            title: new Text('Stock'),
          ),

          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),

          new BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_sharp),
            title: new Text('Customers'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password': password,
      'first_name': fname,
      "identification_number": "199501107429885",
      "gender": "Male",
      'surname': lname
    };

    var res = await Network().authData(data, '/register-customer');
    var body = json.decode(res.body);
    log('data: $res');

    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ListCustomers()
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
