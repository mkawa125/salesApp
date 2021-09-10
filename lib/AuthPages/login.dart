import 'package:flutter/material.dart';
import 'package:simusolarApp/Controllers/databasehelper.dart';
import 'package:simusolarApp/AuthPages/dashboard.dart';
import 'package:simusolarApp/AuthPages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simusolarApp/HomePages/home.dart';
import 'package:simusolarApp/HomePages/home_widget.dart';
import 'package:simusolarApp/Controllers/api.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _passwordVisible = false;
  bool _isInAsyncCall = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.teal,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 24,
                        right: MediaQuery.of(context).size.width * .15,
                        left: MediaQuery.of(context).size.width * .15,
                      ),
                      child: Center(
                        child: Text("Login",
                          style: GoogleFonts.sourceCodePro(
                            fontSize: MediaQuery.of(context).size.width * .089,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),

                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),

                                    labelText: "Enter Email",
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                  onChanged: (value){
                                    setState(() {
                                      email = value;
                                    });
                                  },

                                  validator: (value){
                                    bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$') as bool;
                                    if(value.isEmpty || value.length < 4 || !emailValid){
                                      return "Please enter correct values";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  obscureText: !_passwordVisible,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      child: Icon(_passwordVisible?
                                      Icons.visibility
                                          : Icons.visibility_off
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),

                                    labelText: "Enter Password",
                                    labelStyle: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                  validator: (passwordValue) {
                                    if (passwordValue.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    password = passwordValue;
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading? 'Processing...' : 'Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.teal,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(8.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _login();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Create new Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _login() async{
    setState(() {
      _isLoading = true;
      _isInAsyncCall = true;
    });

    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    var token = body['token'];
    if(token != null){
      // log('data: $body');
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['data']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => Home()
        ),
      );
    }else{
      _isLoading = false;
      _showMsg(body['userMessage']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}