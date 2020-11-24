import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class ApiAuth {
  ApiAuth();

  String endPoint = 'http://192.168.1.207:3000';

  Future<http.Response> doLogin(String username, String password) async {
    String _url = '$endPoint/api/v1/login';
    var body = {"username": username, "password": password};

    return http.post(_url, body: body);
  }

  Future<http.Response> doRegister(String first_last, String email,
      String telephone, String username, String password) async {
    String _url = '$endPoint/api/v1/signup';
    var body = {
      "firstname": first_last,
      "email": email,
      "telephone": telephone,
      "username": username,
      "password": password
    };
    return http.post(_url, body: body);
  }
}
