import 'package:flutter/material.dart';
import 'package:project_pos/controller/auth/api_auth.dart';
import 'package:project_pos/view/login.dart';

import 'all_tap_bottom_bar/tap_bottom_bar.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _RegisterState extends State<Register> {
  TextEditingController _ctrlFirstLast = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlTelephone = TextEditingController();
  TextEditingController __ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();

  ApiAuth apiAuth = ApiAuth();

  Future doRegiter() async {
    try {
      var res = await apiAuth.doRegister(_ctrlFirstLast.text, _ctrlEmail.text,
          _ctrlTelephone.text, __ctrlUsername.text, _ctrlPassword.text);
      if (res.statusCode == 201) {
        print(res.body);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('Server error!');
      }
    } catch (error) {
      print(error);
    }
  }

  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'ผู้จัดการ',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'พนักงาน',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'พนักงงานรับออเดอร์',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
  ];
//
  Widget showFirstname() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "ชื่อ ",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }

  Widget showLastname() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlFirstLast,
            decoration: InputDecoration(
                labelText: "นามสกุล ",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }

  Widget showEmail() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlEmail,
            decoration: InputDecoration(
                labelText: "อีเมล",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }

  Widget showTel() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlTelephone,
            decoration: InputDecoration(
                labelText: "เบอร์โทรศัพท์",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }

  bool checkBoxs = false;
  Widget checkbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: checkBoxs,
          onChanged: (bool value) {
            setState(() {
              checkBoxs = value;
            });
          },
        ),
        Text("ใช้ อีเมลเป็นชื่อผู้ใช้งาน"),
      ],
    );
  }

  Widget showUsername() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: __ctrlUsername,
            decoration: InputDecoration(
                labelText: "ชื่อผู้ใช้งาน (ตัวอักษรไม่ต่ำกว่า 8 ตัว)",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }

  Widget showPassword() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _ctrlPassword,
            decoration: InputDecoration(
                labelText: "รหัสผ่าน (ตัวอักษร 8 - 15 ตัว)",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget showConfrimPassword() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "ยืนยันรหัสผ่าน",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget showDuty() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //         <--- border radius here
            ),
      ),
      child: Column(
        children: [
          DropdownButton<Item>(
            hint: Text("เลือกหน้าที่"),
            value: selectedUser,
            onChanged: (Item Value) {
              setState(() {
                selectedUser = Value;
              });
            },
            items: users.map((Item user) {
              return DropdownMenuItem<Item>(
                value: user,
                child: Row(
                  children: <Widget>[
                    user.icon,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.name,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget showBtRegisters() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: Color(0xff4551C4),
            )),
        color: Color(0xff4551C4),
        textColor: Colors.white,
        padding: EdgeInsets.all(10.0),
        // onPressed: () {
        //   print('สมัครสมาชิก');
        // },
        onPressed: () => doRegiter(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "สมัครสมาชิก",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('สมัครสมาชิก'))),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' ข้อมูลส่วนตัว'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(child: showFirstname()),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(child: showLastname()),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: showEmail(),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: showTel(),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              checkbox(),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(' ข้อมูลส่วนตัวการเข้าสู่ระบบ'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              showUsername(),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(child: showPassword()),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(child: showConfrimPassword()),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(child: showDuty()),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              showBtRegisters(),
            ],
          ),
        ),
      ),
    );
  }
}
