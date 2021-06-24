import 'package:flutter/material.dart';
import '../screens/CouponList.dart';

class CouponsHome extends StatefulWidget {
  @override
  CouponsHomeState createState() => CouponsHomeState();
}

class CouponsHomeState extends State<CouponsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('KUPONLAR'),
      ),
      body: new Center(
          child: GestureDetector(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CouponList()),
                );
              },
              child: Container(
                height: 120.0,
                width: 240.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(child: Text('KUPONLARI GÖSTER')),
              ))),
    );
  }
}
