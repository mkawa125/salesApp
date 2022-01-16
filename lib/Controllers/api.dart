import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class Network{
  // final String _url = 'http://192.168.43.203:8000/api/v1';
  final String _url = 'http://10.0.2.2:8000/api/v1';

  // if you are using android studio emulator, change localhost to 10.0.2.2
  var tokenHard = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NDIzMTE1ODQsImV4cCI6MTY0MjMxNTE4NCwibmJmIjoxNjQyMzExNTg0LCJqdGkiOiJrbGtkc0Z3TzJQNzZYalRDIiwic3ViIjoiM2MyMTkxNmQtMGY2Yy00ZDg4LWJlZDYtMDM0MWFmODYzM2M2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.it_GRt7HTJfU2xBWjR46QntPXtcFEUp5QTG7t5apZ_Q";
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $token'
        }
    );
  }

  userLogin(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json'
        }
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(
        fullUrl,
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}