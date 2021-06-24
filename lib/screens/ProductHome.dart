import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../screens/ProductDetails.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'create.dart';

class ProductsHome extends StatefulWidget {
  ProductsHome({Key key}) : super(key: key);
  @override
  ProductsHomeState createState() => ProductsHomeState();
}

class ProductsHomeState extends State<ProductsHome> {
  List<Product> urunler = [];
  final brandsListKey = GlobalKey<ProductsHomeState>();

  @override
  void initState() {
    super.initState();
    getProductList().then((value) {
      setState(() {
        urunler = value;
      });
    });
  }

  Future<List<Product>> getProductList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/product_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Product> urunler = items.map<Product>((json) {
      return Product.fromJson(json);
    }).toList();

    return urunler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: brandsListKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ÜRÜNLER'),
      ),
      body: urunler.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: urunler.length,
              itemBuilder: (BuildContext context, int index) {
                var data = urunler[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                        '${ProductImageLink.URL_PREFIX}/${data.image}'),
                    trailing: Icon(Icons.view_list),
                    title: Text(
                      data.product_name,
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(urun: data)),
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
