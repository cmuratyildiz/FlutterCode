import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import '../models/Category.dart';

class Details extends StatefulWidget {
  final Category kategori;

  Details({this.kategori});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void deleteKategori(context) async {
    await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/category_delete.php"),
      body: {
        'category_id': widget.kategori.id.toString(),
      },
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
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Icon(Icons.check_circle),
              onPressed: () => deleteKategori(context),
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
        title: Text('Kategori Detayı'),
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
                    '${SiteImageLink.URL_PREFIX}/${widget.kategori.img}'),
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
            "Kategori Adı : ${widget.kategori.name}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Kategori Açıklaması : ${widget.kategori.description}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Text(
            "Kategori Url : ${widget.kategori.url}",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
      ),
    );
  }
}
