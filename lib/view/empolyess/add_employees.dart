import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_pos/view/all_tap_bottom_bar/tap_bottom_bar_empolyess.dart';

import '../all_tap_bottom_bar/tap_bottom_bar.dart';

class Add_Employees extends StatefulWidget {
  Add_Employees({Key key}) : super(key: key);

  @override
  _Add_EmployeesState createState() => _Add_EmployeesState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _Add_EmployeesState extends State<Add_Employees> {
  //
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

  Widget showAddFirstname() {
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

  Widget showAddLastname() {
    return Container(
      child: Column(
        children: [
          TextFormField(
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

  Widget showName() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  prefix: Text('ชื่อ - นามสกุล'),
                  labelText: "ชื่อ - นามสกุล",
                  labelStyle: TextStyle(color: Colors.grey),
                  errorStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget showPhoneNumber() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: InputDecoration(
                prefix: Text('หมายเลขโทรศัพท์'),
                labelText: "หมายเลขโทรศัพท์",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget showAddUsername() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                prefix: Text('ชื่อผู้ใช้งาน'),
                labelText: "ชื่อผู้ใช้งาน",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showCondition() {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'ชื่อผู้ใช้สำหรับการเข้าสู่ระบบของพนักงานไม่สามารถเปลี่ยนภายหลังได้',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget showAddPassword() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                prefix: Text('รหัสผ่าน'),
                labelText: "รหัสผ่าน",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget showAddConfrimPassword() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                prefix: Text('ยืนยันรหัสผ่าน'),
                labelText: "ยืนยันรหัสผ่าน",
                labelStyle: TextStyle(color: Colors.grey),
                errorStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget showAddDuty() {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
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

  Widget showBtAddSave() {
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
          print('บันทึก');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "บันทึก",
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
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("ต้องการเพิ่มพนักงานหรือไม่")),
      actions: [
        Container(
          width: 250.0,
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
            'เพิ่มพนักงาน',
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
            children: [
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(child: showAddFirstname()),
                      SizedBox(
                        width: 30.0,
                      ),
                      Expanded(child: showAddLastname()),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  showPhoneNumber(),
                  SizedBox(
                    height: 10.0,
                  ),
                  showAddUsername(),
                  SizedBox(
                    height: 10.0,
                  ),
                  showCondition(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: showAddPassword(),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: showAddConfrimPassword(),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: showAddDuty(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  showBtAddSave(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
