import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Food_All extends StatefulWidget {
  Food_All({Key key}) : super(key: key);

  @override
  _Food_AllState createState() => _Food_AllState();
}

class _Food_AllState extends State<Food_All> {
  List<String> listHeader = [
    '',
  ];
  List<String> listTitle = [
    'รายการอาหาร1',
    'รายการอาหาร2',
    'รายการอาหาร3',
    'รายการอาหาร4',
    'รายการอาหาร5',
    'รายการอาหาร6',
    'รายการอาหาร7',
    'รายการอาหาร8',
    'รายการอาหาร9',
    'รายการอาหาร10',
    'รายการอาหาร11',
    'รายการอาหาร12',
    'รายการอาหาร13',
    'รายการอาหาร14',
    'รายการอาหาร15',
    'รายการอาหาร16',
    'รายการอาหาร17',
    'รายการอาหาร18',
    'รายการอาหาร19',
    'รายการอาหาร20',
  ];

  Widget gridHeader() {
    return new ListView.builder(
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Container(
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            child: new Text(
              listHeader[index],
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (contxt, indx) {
                return Card(
                  margin: EdgeInsets.all(10.0),
                  color: Color(0xFF4B59D4),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 6.0, bottom: 2.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                          onPressed: () {
                            print(listTitle[indx]);
                          },
                          child: Text(
                            listTitle[indx],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      shrinkWrap: true,
    );
  }

  Widget showTotalMoney() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Text(
                'ยอดทั้งหมด',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                '฿0.00',
                style: TextStyle(color: Color(0xff0011AF)),
              ),
            ],
          ),
          Column(
            children: [
              FlatButton(
                onPressed: () {
                  print('ออกบิล');
                },
                child: Column(
                  children: [
                    Text(
                      'ออกบิล',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Icon(
                      Icons.print_outlined,
                      color: Color(0xff0011AF),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget showBTCheckOut() {
    return Container(
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {
          print('ออกบิล');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ออกบิล',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.laptop_windows_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }

  bool checkBoxs = false;
  Widget checkbox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: checkBoxs,
                onChanged: (bool value) {
                  setState(() {
                    checkBoxs = value;
                  });
                },
              ),
              Text("สั่งกลับบ้าน"),
            ],
          ),
        ],
      ),
    );
  }

  Widget showCheckMoney() {
    final items = List<String>.generate(11, (i) => "฿0.00 ");
    return new Container(
      width: 250.00,
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
        border: Border.all(
          width: 1.00,
          color: Color(0xFFE9E9E9),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 4.00),
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ไม่มียอดขาย'),
                    IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {
                          print('More');
                        }),
                  ],
                ),
                new Divider(
                  color: Colors.grey,
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${items[index]}',
                            style: TextStyle(
                                color: Color(0xff0011AF), fontSize: 12.0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Divider(
                  color: Colors.grey,
                ),
                checkbox(),
                new Divider(
                  color: Colors.grey,
                ),
                showTotalMoney(),
                showBTCheckOut(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'เมนูแนะนำทั้งหมด',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.local_dining,
                    color: Color(0xff4551C4),
                    size: 35.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(child: gridHeader()),
            SizedBox(
              width: 10.0,
            ),
            showCheckMoney(),
          ],
        ),
      ),
    );
  }
}
