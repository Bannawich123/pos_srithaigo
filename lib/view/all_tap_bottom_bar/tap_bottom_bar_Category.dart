import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_pos/view/food_menu/category.dart';
import 'package:project_pos/view/food_menu/edit_list_food.dart';
import 'package:project_pos/view/food_menu/food_all.dart';
import 'package:project_pos/view/menu.dart';

class TapBottomBar_Category extends StatefulWidget {
  @override
  final String page;
  TapBottomBar_Category({this.page});
  _TapBottomBar_CategoryState createState() =>
      _TapBottomBar_CategoryState(page);
}

int selectedIndex = 0;

final List<Widget> _children = [
  Menu(),
  Food_All(),
  Category(),
  Edit_list_food(),
];

class _TapBottomBar_CategoryState extends State<TapBottomBar_Category> {
  String page;
  _TapBottomBar_CategoryState(this.page);
  DateTime backbuttonpressedTime;

  Future<bool> _onBackPressed() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 1);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(msg: "กดอีกครั้งเพื่อออก");
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: _children[selectedIndex], bottomNavigationBar: bottomBar()),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    checkView();
  }

  Future<Null> checkView() {
    switch (page) {
      case "menu":
        selectedIndex = 0;
        break;
      case "food_all":
        selectedIndex = 1;
        break;
      case "category":
        selectedIndex = 2;
        break;
      case "edit_list_food":
        selectedIndex = 3;
        break;
      default:
        selectedIndex = 0;
    }
  }

  Widget bottomBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            // ignore: deprecated_member_use
            title: Text(
              'เมนู',
              style: TextStyle(fontSize: 13),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            // ignore: deprecated_member_use
            title: Text(
              'เมนูทั้งหมด',
              style: TextStyle(fontSize: 13),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            // ignore: deprecated_member_use
            title: Text(
              'หมวดอาหาร',
              style: TextStyle(fontSize: 13),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            // ignore: deprecated_member_use
            title: Text(
              'รายการ',
              style: TextStyle(fontSize: 13),
            )),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.power_input_rounded),
        //     // ignore: deprecated_member_use
        //     title: Column(
        //       children: [
        //         Text(
        //           '02',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //         Text(
        //           'ชุดชาบูและสุกี้',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //         Text(
        //           '(Shabu &suki)',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //       ],
        //     )),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.power_input_rounded),
        //     // ignore: deprecated_member_use
        //     title: Column(
        //       children: [
        //         Text(
        //           '03',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //         Text(
        //           'ชาบูจานเดียว',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //         Text(
        //           '(A la carte)',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //       ],
        //     )),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.power_input_rounded),
        //     // ignore: deprecated_member_use
        //     title: Column(
        //       children: [
        //         Text(
        //           '04',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //         Text(
        //           'ผัก (Vegetable)',
        //           style: TextStyle(fontSize: 13),
        //         ),
        //       ],
        //     )),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.assignment),
        //     // ignore: deprecated_member_use
        //     title: Text(
        //       'รายการ',
        //       style: TextStyle(fontSize: 13),
        //     )),
      ],
      currentIndex: selectedIndex,
      fixedColor: Color(0xff0011AF),
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.green[35],
    );
  }
}
