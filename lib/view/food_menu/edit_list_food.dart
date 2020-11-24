import 'package:flutter/material.dart';
import 'package:project_pos/view/food_menu/create_list_food.dart';

class Edit_list_food extends StatefulWidget {
  Edit_list_food({Key key}) : super(key: key);

  @override
  _Edit_list_foodState createState() => _Edit_list_foodState();
}

class _Edit_list_foodState extends State<Edit_list_food> {
  //
  Widget showAddCountSelect() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('เพิ่มจำนวนตามเลือก');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 40.0,
                color: Color(0xff4551C4),
              ),
              SizedBox(width: 20.0),
              Text(
                'เพิ่มจำนวนตามเลือก',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff4551C4),
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
        ],
      ),
    );
  }

  Widget showCoupon() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('ส่วนลด');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.card_giftcard_outlined,
                size: 40.0,
                color: Color(0xff4551C4),
              ),
              SizedBox(width: 20.0),
              Text(
                'ส่วนลด',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff4551C4),
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
        ],
      ),
    );
  }

  Widget showListAll() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        print('รายการสินค้าทั้งหมด');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.format_list_bulleted_outlined,
                size: 40.0,
                color: Color(0xff4551C4),
              ),
              SizedBox(width: 20.0),
              Text(
                'รายการสินค้าทั้งหมด',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff4551C4),
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 40.0,
            color: Color(0xff4551C4),
          ),
        ],
      ),
    );
  }

  Widget showListCategory() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 12,
            itemBuilder: (con, index) {
              return OutlineButton(
                onPressed: () {
                  print('หมวดอาหาร $index');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_dining_outlined,
                          size: 40.0,
                          color: Color(0xff4551C4),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          'หมวดอาหาร $index',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff4551C4),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40.0,
                      color: Color(0xff4551C4),
                    ),
                  ],
                ),
              );
            }));
  }

  Widget showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actions: [
        Container(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlineButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Create_list_food()),
                  );
                  print('เพิ่มรายการ');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff0011AF),
                      size: 35.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'เพิ่มรายการ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              OutlineButton(
                onPressed: () {
                  print('เพิ่มส่วนลด');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff0011AF),
                      size: 35.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'เพิ่มส่วนลด',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              OutlineButton(
                onPressed: () {
                  print('เพิ่ม/แก้ไขประเภท');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Color(0xff0011AF),
                      size: 35.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'เพิ่ม/แก้ไขประเภท',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
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
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'รายการ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          OutlineButton(
            highlightedBorderColor: Colors.transparent,
            splashColor: Color(0xFFEEEEEE),
            textColor: Colors.white,
            onPressed: () {
              showAlertDialog(context);
              print('แก้ไข');
            },
            child: Text(
              "แก้ไข",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Color(0xff0011AF),
              ),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showAddCountSelect(),
              SizedBox(
                height: 5.0,
              ),
              showCoupon(),
              SizedBox(
                height: 5.0,
              ),
              showListAll(),
              SizedBox(
                height: 5.0,
              ),
              showListCategory()
            ],
          ),
        ),
      ),
    );
  }
}
