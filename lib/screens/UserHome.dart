import 'package:flutter/material.dart';
import '../models/User.dart';
import '../screens/UserDetails.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'create.dart';

class UserHome extends StatefulWidget {
  UserHome({Key key}) : super(key: key);
  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> {
  List<User> kullanicilar = [];
  final userListKey = GlobalKey<UserHomeState>();

  @override
  void initState() {
    super.initState();
    getUserList().then((value) {
      setState(() {
        kullanicilar = value;
      });
    });
  }

  Future<List<User>> getUserList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/user_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<User> kullanicilar = items.map<User>((json) {
      return User.fromJson(json);
    }).toList();

    return kullanicilar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: userListKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('KULLANICILAR'),
      ),
      body: kullanicilar.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: kullanicilar.length,
              itemBuilder: (BuildContext context, int index) {
                var data = kullanicilar[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetails(kullanici: data)),
                      );
                    },
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
