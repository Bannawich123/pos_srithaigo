import 'package:flutter/material.dart';

class Create_list_food extends StatefulWidget {
  Create_list_food({Key key}) : super(key: key);

  @override
  _Create_list_foodState createState() => _Create_list_foodState();
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class _Create_list_foodState extends State<Create_list_food> {
  //
  Item selectedcategory_food;
  List<Item> category_food = <Item>[
    const Item(
        'ชุดชาบูและสุกี้',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ชาบูจานเดียว',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ผัก',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'อาหารว่าง',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'สลัด',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'เทมปุระ',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ย่าง',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ข้าวแกงกระหรี่',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ข้าวหน้าต่างๆ',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ซาชิมิ',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ข้าวปั้น',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'ประเภทเส้น',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
    const Item(
        'เครื่องดื่ม',
        Icon(
          Icons.remove,
          color: const Color(0xFF4551C4),
        )),
  ];
  //
  Widget showNameFood() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  prefix: Text('ชื่ออาหาร'),
                  labelText: "ชื่ออาหาร",
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

  Widget showCategory_food() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'หมวดอาหาร',
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
              DropdownButton<Item>(
                hint: Text('หมวดอาหาร'),
                value: selectedcategory_food,
                onChanged: (Item Value) {
                  setState(() {
                    selectedcategory_food = Value;
                  });
                },
                items: category_food.map((Item user) {
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
        ],
      ),
    );
  }

  Widget showSmallSize() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  prefix: Text('ขนาดเล็ก'),
                  labelText: "ขนาดเล็ก",
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

  Widget showBigSize() {
    return Container(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  prefix: Text('ขนาดใหญ่'),
                  labelText: "ขนาดใหญ่",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Center(
          child: Text(
            'สร้างรายการ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: <Widget>[
          OutlineButton(
            highlightedBorderColor: Colors.transparent,
            splashColor: Color(0xFFEEEEEE),
            textColor: Colors.white,
            onPressed: () {
              print('บันทึก');
            },
            child: Text(
              "บันทึก",
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
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              showNameFood(),
              SizedBox(
                height: 5.0,
              ),
              showCategory_food(),
              SizedBox(
                height: 5.0,
              ),
              showSmallSize(),
              SizedBox(
                height: 5.0,
              ),
              showBigSize(),
            ],
          ),
        ),
      ),
    );
  }
}
