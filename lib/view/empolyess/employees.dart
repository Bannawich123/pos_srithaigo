import 'package:flutter/material.dart';
import 'package:project_pos/view/all_tap_bottom_bar/tap_bottom_bar_empolyess.dart';
import 'package:project_pos/view/empolyess/change_password.dart';

import '../all_tap_bottom_bar/tap_bottom_bar.dart';
import '../login.dart';
import 'add_employees.dart';

class Employees extends StatefulWidget {
  Employees({Key key}) : super(key: key);

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  //
  //
  Widget showTitle() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 1.00,
          color: Color(0xffe5e5e5),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 11.0,
          ),
          Text(
            'จัดการพนักงาน',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff3d3d3d),
            ),
          ),
          new Divider(
            color: Color(0xffE5E5E5),
          ),
          showBTAddEmp(),
        ],
      ),
    );
  }

  Widget showTitleName() {
    return Container(
      width: 745,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 1.00,
          color: Color(0xffe5e5e5),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14.0,
          ),
          Text(
            'Demo',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff3d3d3d),
            ),
          ),
          new Divider(
            color: Color(0xffE5E5E5),
          ),
          // new Container(
          //   height: 240.00,
          //   width: 745.00,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("images/Logo.png"),
          //     ),
          //     borderRadius: BorderRadius.circular(6.00),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(10.0),
          //   child: Column(
          //     children: [
          //       showFullname(),
          //       showPhoneNumber(),
          //       showDuty(),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           showBtDelEmp(),
          //           showBtChangPass(),
          //         ],
          //       ),
          //       showBtLogout(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget showFullname() {
    return new Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.00,
          color: Color(0xff4551c4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ชื่อ-นามสกุล',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Demo',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4551c4),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 35.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showPhoneNumber() {
    return new Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.00,
          color: Color(0xff4551c4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'หมายเลขโทรศัพท์',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '086-XXX-XXXX',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4551c4),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 35.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showDuty() {
    return new Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.00,
          color: Color(0xff4551c4),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'หน้าที่',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'พนักงาน',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4551c4),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 35.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showBTAddEmp() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 200.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xff4551C4))),
              color: Colors.white,
              textColor: Color(0xff4551C4),
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pop(context); //pop dialog
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Add_Employees());
                Navigator.pushAndRemoveUntil(context, route, (route) => true);

                print('เพิ่มพนักงาน');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: Color(0xff4551C4),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "เพิ่มพนักงาน".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
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

  Widget showBtDelEmp() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 300.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.red,
                  )),
              color: Colors.white,
              textColor: Colors.red,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                showAlertDialog(context);
                print('ลบพนักงาน');
              },
              child: Text(
                "ลบพนักงาน".toUpperCase(),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showBtChangPass() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 300.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff4551C4),
                  )),
              color: Colors.white,
              textColor: Color(0xff4551C4),
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pop(context); //pop dialog
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Change_password());
                Navigator.pushAndRemoveUntil(context, route, (route) => true);
                print('เปลี่ยนรหัสผ่าน');
              },
              child: Text(
                "เปลี่ยนรหัสผ่าน".toUpperCase(),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showBtLogout() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff4551C4),
                  )),
              color: Color(0xff4551C4),
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pop(context); //pop dialog
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Login());
                Navigator.pushAndRemoveUntil(context, route, (route) => true);
                print('ออกจากระบบ');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ออกจากระบบ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Icon(Icons.logout)
                ],
              ),
            ),
          ),
        ],
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
            Icons.person_remove_alt_1_outlined,
            size: 80.0,
            color: Colors.red,
          ),
          Text("ยืนยันการลบพนักงาน"),
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
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text('จัดการพนักงาน')),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(
                width: 1.00,
                color: Color(0xffe5e5e5),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(child: showTitle()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 745,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(
                          width: 1.00,
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            'Demo',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff3d3d3d),
                            ),
                          ),
                          new Divider(
                            color: Color(0xffE5E5E5),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(10.0),
                          //   width: 300,
                          //   height: 195.0,
                          //   child: Image.asset("images/Logo.png"),
                          // ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 14.0,
                                ),
                                showFullname(),
                                showPhoneNumber(),
                                showDuty(),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                showBtDelEmp(),
                                showBtChangPass(),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: showBtLogout(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
