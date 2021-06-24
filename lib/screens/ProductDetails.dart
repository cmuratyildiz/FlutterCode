import 'package:flutter/material.dart';
import '../models/Product.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import 'ProductDetailGrafik.dart';
import 'ProductEdit.dart';

class ProductDetails extends StatefulWidget {
  final Product urun;

  ProductDetails({this.urun});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void deleteProduct(context) async {
    await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/product_delete.php"),
      body: {'product_id': widget.urun.id.toString()},
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Silmek istediğinize emin misiniz?'),
          actions: <Widget>[
            ElevatedButton(
              child: Icon(Icons.cancel),
              //color: Colors.red,
              //textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Icon(Icons.check_circle),
              //color: Colors.blue,
              //textColor: Colors.white,
              onPressed: () => deleteProduct(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ürün Detayı -- [ ${widget.urun.product_name} ]'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          new Container(
            height: 200.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new NetworkImage(
                    '${ProductImageLink.URL_PREFIX}/${widget.urun.image}'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              border: new Border.all(
                color: Colors.red,
                width: 2.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Kategori Numarası : ${widget.urun.category_id}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Ürün Adı : ${widget.urun.product_name}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Ürün Kodu : ${widget.urun.product_code}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Meta Başlığı : ${widget.urun.meta_title}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Meta Açıklaması : ${widget.urun.meta_description}",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ProductDetailGrafik()));
            },
            child: Text("Daha fazla gör"),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => ProductEdit(urun: widget.urun),
          ),
        ),
      ),
    );
  }
}
