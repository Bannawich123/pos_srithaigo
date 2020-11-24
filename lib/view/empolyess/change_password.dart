import 'package:flutter/material.dart';
import 'package:project_pos/view/all_tap_bottom_bar/tap_bottom_bar_empolyess.dart';

class Change_password extends StatefulWidget {
  Change_password({Key key}) : super(key: key);

  @override
  _Change_passwordState createState() => _Change_passwordState();
}

class _Change_passwordState extends State<Change_password> {
//

  Widget showEmpOriginalpassword() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                icon: new Icon(
                  Icons.lock_outline_rounded,
                  size: 35.0,
                ),
                // prefix: Text('รหัสผ่านเดิม'),
                labelText: "รหัสผ่านเดิม",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmpPassword() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                icon: new Icon(
                  Icons.lock_outline_rounded,
                  size: 35.0,
                ),
                //  prefix: Text('รหัสผ่าน'),
                labelText: "รหัสผ่านใหม่",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmpConfrimPassword() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                icon: new Icon(
                  Icons.lock_outline_rounded,
                  size: 35.0,
                ),
                // prefix: Text('ยืนยันรหัสผ่าน'),
                labelText: "ยืนยันรหัสผ่านใหม่",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmpBtConfrimChange() {
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
        onPressed: () {
          showAlertDialog(context);
          print('ยืนยันการเปลี่ยนรหัสผ่าน');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ยืนยันการเปลี่ยนรหัสผ่าน",
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

  Widget showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.0,
            color: Colors.red,
          ),
          Text("ยืนยันการเปลี่ยนรหัสผ่านหรือไม่"),
        ],
      )),
      actions: [
        Container(
          width: 300.0,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100.0,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "ยกเลิก",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                  child: RaisedButton(
                    color: Color(0xff4551C4),
                    onPressed: () {
                      Navigator.pop(context); //pop dialog
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => TapBottomBar_Employees(
                                page: "employees",
                              ));
                      Navigator.pushAndRemoveUntil(
                          context, route, (route) => true);
                    },
                    child: Text(
                      "ยืนยัน",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'เปลี่ยนรหัสผ่าน',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); //pop dialog
            MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => TapBottomBar_Employees(
                      page: "employees",
                    ));
            Navigator.pushAndRemoveUntil(context, route, (route) => true);
          },
          child: Icon(
            Icons.cancel_outlined,
            color: Colors.grey,
            size: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.0,
              ),
              showEmpOriginalpassword(),
              SizedBox(
                height: 20.0,
              ),
              showEmpPassword(),
              SizedBox(
                height: 20.0,
              ),
              showEmpConfrimPassword(),
              SizedBox(
                height: 20.0,
              ),
              showEmpBtConfrimChange(),
            ],
          ),
        ),
      ),
    );
  }
}
