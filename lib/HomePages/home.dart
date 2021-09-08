import 'package:flutter/material.dart';
import 'package:simusolarApp/AuthPages/login.dart';
import "nav_drawer.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:simusolarApp/Controllers/api.dart';
import 'dart:developer';
import 'package:simusolarApp/HomePages/slideLeftRoute.dart';
import 'package:simusolarApp/HomePages/slideRightRoute.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stock_on_hand.dart';




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
            // Center(
            //   child: RaisedButton(
            //     elevation: 10,
            //     onPressed: (){
            //       logout();
            //     },
            //     color: Colors.teal,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            //     child: Text('Logout'),
            //   ),
            // ),

            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.push(
                        context,
                        SlideRightRoute(
                          page: StockOnHand(),
                        )
                    );
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .45,
                      decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.(4)
                      ),
                      child: Padding(padding: EdgeInsets.only(right:8, top:8,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 8, top: 8),
                                child: Text("Sign Up",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                      )
                  ),
                ),
                Spacer(),
                GestureDetector(behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.push(
                      context,
                      SlideLeftRoute(
                        page: LoginPage(),

                      ),
                    );
                  },

                  child: Container(
                      height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .45,
                      decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                          )
                      ),
                      child: Padding(padding: EdgeInsets.only(right:8, top:8,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 8, top: 8),
                                child: Text("Sign In",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                      )
                  ),
                )
              ],
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