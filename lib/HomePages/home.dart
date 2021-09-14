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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




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
      // backgroundColor: Color(0xff00BCD1),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
              child: Text('Welcome, $name',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),

            Card(
              elevation: 4.0,
              color: Colors.white,
              margin: EdgeInsets.only(top: 8, bottom: 15, left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: <Widget>[

                      Center(
                        child: Text('\$ 2,000,000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            color: Colors.red[300]
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Total Collection This month',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
              ),
            ),

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
                      margin: EdgeInsets.only(left:10.0, top:2.0,right:10.0,bottom:2.0),
                      padding: EdgeInsets.all(4),
                      // height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .42,

                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.green[400], Colors.blue[200]]),
                          borderRadius: BorderRadius.circular(4)

                      ),
                      child: Padding(padding: EdgeInsets.only(right:0, top:0,),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(padding: EdgeInsets.only(bottom: 4, top: 0),
                                child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.userCircle,
                                      color:Colors.black87,
                                      size: 15,
                                    )
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 8, top: 0),
                                child: Text("Leads",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.black87,
                                    fontSize: 15,
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
                      margin: EdgeInsets.only(left:10.0, top:2.0,right:10.0,bottom:2.0),
                      padding: EdgeInsets.all(4),
                      // height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .42,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.blue[400], Colors.deepPurpleAccent[200]]),
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                            color: Colors.grey[400].withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
                      child: Padding(padding: EdgeInsets.only(right:8, top:0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(padding: EdgeInsets.only(bottom: 0, top: 0),
                                child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.userCheck,
                                      color:Colors.white,
                                      size: 15,
                                    )
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 8, top: 0),
                                child: Text("Customers",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.white,
                                    fontSize: 15,
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
                      margin: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:2.0),
                      padding: EdgeInsets.all(4),
                      // height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .42,

                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue[100],
                              Colors.red[100],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(4)

                      ),
                      child: Padding(padding: EdgeInsets.only(right:0, top:0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(padding: EdgeInsets.only(bottom: 0, top: 0),
                                child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.userCircle,
                                      color:Colors.black87,
                                      size: 15,
                                    )
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 8, top: 0),
                                child: Text("Leads",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.black87,
                                    fontSize: 15,
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
                      margin: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:2.0),
                      padding: EdgeInsets.all(4),
                      // height: MediaQuery.of(context).size.height * .10,
                      width: MediaQuery.of(context).size.width * .42,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red[100],
                              Colors.greenAccent[100],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Padding(padding: EdgeInsets.only(right:8, top:0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(padding: EdgeInsets.only(bottom: 0, top: 0),
                                child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.userCheck,
                                      color:Colors.white,
                                      size: 15,
                                    )
                                ),
                              ),

                              Padding(padding: EdgeInsets.only(bottom: 8, top: 0),
                                child: Text("Customers",
                                  style: GoogleFonts.sourceCodePro(
                                    color: Colors.white,
                                    fontSize: 15,
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

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 35, bottom: 8),
              child: Text('Next Due Customers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),

            Container(
              height: 200.0,
              padding: EdgeInsets.all(0),
              child: ListView.builder(
                  itemCount: 4,
                  itemExtent: 40.0,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                        leading: Icon(Icons.account_circle),
                        trailing: Text("+3 days",
                          style: TextStyle(
                              color: Colors.red[300],fontSize: 15),),
                        title:Text("Customer Name $index",
                          style: TextStyle(
                              color: Colors.grey[700],fontSize: 15),),
                    );
                  }
              ),
            ),




            // Center(
            //   child: ElevatedButton(
            //     onPressed: (){
            //       logout();
            //     },
            //     child: Text('Logout'),
            //
            //   ),
            //
            // ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Logout',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.teal,
                minWidth: MediaQuery.of(context).size.width,
                disabledColor: Colors.grey,
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(4.0)
                ),
                onPressed: () {
                  logout();
                },
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