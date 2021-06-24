import 'package:flutter/material.dart';
import '../models/Category.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './details.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Category> kategoriler = [];
  final kategoritKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    getCategoryList().then((value) {
      setState(() {
        kategoriler = value;
      });
    });
  }

  Future<List<Category>> getCategoryList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/category_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Category> kategoriler = items.map<Category>((json) {
      return Category.fromJson(json);
    }).toList();

    return kategoriler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kategoritKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ANA KATEGORİLER'),
      ),
      body: kategoriler.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: kategoriler.length,
              itemBuilder: (BuildContext context, int index) {
                var data = kategoriler[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(kategori: data)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
