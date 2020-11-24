import 'package:flutter/material.dart';
import 'package:project_pos/view/all_tap_bottom_bar/tap_bottom_bar_Category.dart';
import 'package:project_pos/view/all_tap_bottom_bar/tap_bottom_bar_set_print.dart';
import 'package:project_pos/view/login.dart';

import 'all_tap_bottom_bar/tap_bottom_bar_empolyess.dart';
import 'all_tap_bottom_bar/tap_bottom_bar_order_bill.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //
  Widget showCatFood() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context); //pop dialog
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => TapBottomBar_Category(
                  page: "category",
                ));
        Navigator.pushAndRemoveUntil(context, route, (route) => true);
        print('หมวดอาหาร');
      },
      child: Row(
        children: [
          Icon(
            Icons.local_dining,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'หมวดอาหาร',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showTable() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('จัดการโต๊ะ');
      },
      child: Row(
        children: [
          Icon(
            Icons.table_rows_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'จัดการโต๊ะ',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showOrderList() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context); //pop dialog
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => TapBottomBar_Order_Bill(
                  page: "order_bill_pang",
                ));
        Navigator.pushAndRemoveUntil(context, route, (route) => true);
        print('จัดการออเดอร์');
      },
      child: Row(
        children: [
          Icon(
            Icons.event_note_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'จัดการออเดอร์',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showMoney() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('ชำระเงิน');
      },
      child: Row(
        children: [
          Icon(
            Icons.credit_card_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'ชำระเงิน',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showSaleList() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('รายงานการขาย');
      },
      child: Row(
        children: [
          Icon(
            Icons.assignment,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'รายงานการขาย',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showWareHouse() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('จัดการสินค้าคงคลัง');
      },
      child: Row(
        children: [
          Icon(
            Icons.home_work_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'จัดการสินค้าคงคลัง',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmployees() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context); //pop dialog
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => TapBottomBar_Employees(
                  page: "employees",
                ));
        Navigator.pushAndRemoveUntil(context, route, (route) => true);
        print('จัดการพนักงาน');
      },
      child: Row(
        children: [
          Icon(
            Icons.group_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'จัดการพนักงาน',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showSetPrinter() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context); //pop dialog
        MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => TapBottomBar_SetPrinter(
                  page: "set_printer",
                ));
        Navigator.pushAndRemoveUntil(context, route, (route) => true);
        print('ตั้งค่าเครื่องพิมพ์');
      },
      child: Row(
        children: [
          Icon(
            Icons.print_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'ตั้งค่าเครื่องพิมพ์',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  Widget showLogout() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('ออกจากระบบ');
        Navigator.pop(context); //pop dialog
        MaterialPageRoute route =
            MaterialPageRoute(builder: (context) => Login());
        Navigator.pushAndRemoveUntil(context, route, (route) => true);
      },
      child: Row(
        children: [
          Icon(
            Icons.login_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
          SizedBox(width: 20.0),
          Text(
            'ออกจากระบบ',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff4551C4),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'เมนูต่างๆ',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  showCatFood(),
                  showTable(),
                  showOrderList(),
                  showMoney(),
                  showWareHouse(),
                  showEmployees(),
                  showSetPrinter(),
                  showLogout(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
