import 'package:flutter/material.dart';
import 'package:simusolarApp/Controllers/databasehelper.dart';
import 'package:simusolarApp/AuthPages/login.dart';


class RegisterPage extends StatefulWidget{

  RegisterPage({Key key , this.title}) : super(key : key);
  final String title;

  @override
  RegisterPageState  createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();


  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.registerData(_nameController.text.trim(),_emailController.text.trim().toLowerCase(),

            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            Navigator.pushReplacementNamed(context, '/dashboard');


          }
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Register',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Register'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Place your name',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Place your email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Place your password',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child: new Text(
                    'Register',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),
                  ),
                ),
              ),

              // Container(
              //   height: 50,
              //   child: new Text(
              //     '$msgStatus',
              //     textAlign: TextAlign.center,
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                  ),
                  child: Container(
                    width: 50,
                    child: new Text(
                      'Already Have Account? Login',
                      style: new TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),

                onTap: ()=>Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new LoginPage(),
                    )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}