import 'package:flutter/material.dart';

class Order_Bill_Pang extends StatefulWidget {
  Order_Bill_Pang({Key key}) : super(key: key);

  @override
  _Order_Bill_PangState createState() => _Order_Bill_PangState();
}

class _Order_Bill_PangState extends State<Order_Bill_Pang> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            bottom: TabBar(
              onTap: (index) {
                // Tab index when user select it, it start from zero
              },
              tabs: [
                Tab(
                  text: 'บิล',
                ),
                Tab(
                  text: 'ด้านใน',
                ),
              ],
            ),
            title: Center(child: Text('จัดการออเดอร์')),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Text(
                "0",
                style: TextStyle(fontSize: 40),
              )),
              Center(
                  child: Text(
                "1",
                style: TextStyle(fontSize: 40),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
