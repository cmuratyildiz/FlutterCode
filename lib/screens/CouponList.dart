import 'package:flutter/material.dart';
import '../models/Coupon.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './create.dart';

class CouponList extends StatefulWidget {
  CouponList({Key key}) : super(key: key);
  @override
  CouponListState createState() => CouponListState();
}

class CouponListState extends State<CouponList> {
  List<Coupon> kuponlar = [];
  final kuponKey = GlobalKey<CouponListState>();

  @override
  void initState() {
    super.initState();
    getCouponList().then((value) {
      setState(() {
        kuponlar = value;
      });
    });
  }

  Future<List<Coupon>> getCouponList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/coupon_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Coupon> kuponlar = items.map<Coupon>((json) {
      return Coupon.fromJson(json);
    }).toList();

    return kuponlar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kuponKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('AKTİF KUPONLAR'),
      ),
      body: kuponlar.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: kuponlar.length,
              itemBuilder: (BuildContext context, int index) {
                var data = kuponlar[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.coupon_code,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Create();
          }));
        },
      ),
    );
  }
}
