import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  List<String> listHeader = [
    '',
  ];
  List<String> listTitle = [
    'ชุดชาบูและสุกี้ \n (Shabu &suki)',
    'ชาบูจานเดียว  \n  (A la carte)',
    'ผัก \n (Vegetable)',
    'อาหารว่าง \n (APPETIZER)',
    'สลัด \n (Salad)',
    'เทมปุระ \n  (Tempura)',
    'ย่าง\n (Grilled)',
    'ข้าวแกงกระหรี่\n  (Curry rice) ',
    'ข้าวหน้าต่างๆ \n (Donburi)',
    'ซาชิมิ \n (Sashimi)',
    'ข้าวปั้น \n (Maki, Nigiri)',
    'ประเภทเส้น \n (Noodle)',
    'เครื่องดื่ม \n (Water) ',
  ];

  Widget gridHeader() {
    return new ListView.builder(
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Container(
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              listHeader[index],
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listTitle.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (contxt, indx) {
                return Card(
                  margin: EdgeInsets.all(4.0),
                  color: Color(0xFF4B59D4),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 6.0, bottom: 2.0),
                    child: Container(
                      child: FlatButton(
                        onPressed: () {
                          print(listTitle[indx]);
                        },
                        child: Center(
                            child: Text(
                          listTitle[indx],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
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
                    'หมวดอาหาร',
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
      body: gridHeader(),
    );
  }
}
