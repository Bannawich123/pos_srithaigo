import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_pos/controller/auth/api_auth.dart';
import 'package:project_pos/view/register.dart';

import 'all_tap_bottom_bar/tap_bottom_bar.dart';
import 'empolyess/employees.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  final _forKey = GlobalKey<FormState>();

  ApiAuth apiAuth = ApiAuth();

  Future doLogin() async {
    try {
      var res = await apiAuth.doLogin(_ctrlUsername.text, _ctrlPassword.text);
      if (res.statusCode == 200) {
        print(res.body);
        var jsonRes = json.decode(res.body);

        if (jsonRes['ok']) {
          String token = jsonRes['token'];
          print(token);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          // redirect
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Employees()));
        } else {
          print(jsonRes['error']);
        }
      } else {
        print('Server error!');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget showUsername() {
    return Container(
      width: 500.0,
      child: Column(
        children: [
          TextFormField(
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Please enter username';
            //   }
            // },
            controller: _ctrlUsername,
            decoration: new InputDecoration(
              labelText: "Username",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            keyboardType: TextInputType.emailAddress,
            maxLines: 3,
            minLines: 1,
          ),
        ],
      ),
    );
  }

  Widget showPassword() {
    return Container(
      width: 500.0,
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlPassword,
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Please enter password';
            //   }
            // },
            decoration: new InputDecoration(
              labelText: "Password",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            obscureText: true,
          ),
          Row(
            children: [
              showRememberMe(),
            ],
          ),
        ],
      ),
    );
  }

  Widget showBtLogin() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: Color(0xff0011AF))),
            color: Color(0xff0011AF),
            textColor: Color(0xFF4B59D4),
            padding: EdgeInsets.all(8.0),
            onPressed: () {
              Navigator.pop(context); //pop dialog
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => TapBottomBar(
                        page: "food_all",
                      ));
              Navigator.pushAndRemoveUntil(context, route, (route) => true);
              print('เข้าสู่ระบบ');
            },
            // onPressed: () => doLogin(),
            child: SizedBox(
              width: 350.0,
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "เข้าสู่ระบบ".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showBTRegister() {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
        print('สมัคสมาชิก');
      },
      child: Text(
        'สมัคสมาชิก',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.red,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  bool checkbox_value = false;
  Widget showRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          activeColor: Color(0xFF4B59D4),
          value: checkbox_value,
          onChanged: (bool value) {
            setState(() {
              checkbox_value = value;
              print(checkbox_value);
            });
          },
        ),
        Text("จำรหัสผ่าน"),
      ],
    );
  }

  Widget showCreditBy() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Credit by ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              width: 130.0,
              child: Image.asset('images/Logo_Srithaigo.png',
                  fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   height: 20.0,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 250.0,
                        child: Image.asset('images/Logo.png',
                            fit: BoxFit.fitWidth)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                showUsername(),
                SizedBox(
                  height: 20.0,
                ),
                showPassword(),

                // showRememberMe(),
                showBtLogin(),
                SizedBox(
                  height: 5.0,
                ),

                // showBTRegister(),
                showCreditBy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
