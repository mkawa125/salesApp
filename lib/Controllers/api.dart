import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class Network{
  // final String _url = 'http://192.168.43.203:8000/api/v1';
  final String _url = 'http://10.0.2.2:8000/api/v1';

  // if you are using android studio emulator, change localhost to 10.0.2.2
  var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NDIyNzA1OTMsImV4cCI6MTY0MjI3NDE5MywibmJmIjoxNjQyMjcwNTkzLCJqdGkiOiIxUWk5MHhLQ3JPZnZuTzNXIiwic3ViIjoiM2MyMTkxNmQtMGY2Yy00ZDg4LWJlZDYtMDM0MWFmODYzM2M2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.a5_UZv5y8dPvM0GENCSvIseXHmGVtSkOK5uEQ9P_Reg";

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: {
          'Content-type' : 'application/json',
          'Accept' : 'application/json',
          'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC92MVwvbG9naW4iLCJpYXQiOjE2NDIyNzQ1MjQsImV4cCI6MTY0MjI3ODEyNCwibmJmIjoxNjQyMjc0NTI0LCJqdGkiOiJRVVdnUmRod3N4RTc3b3JhIiwic3ViIjoiM2MyMTkxNmQtMGY2Yy00ZDg4LWJlZDYtMDM0MWFmODYzM2M2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.3nmPMDo4bQ_gwDuEYWm_YvVOqoa5_V4FsMGzd61MlZ8'
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