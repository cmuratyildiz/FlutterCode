import 'package:flutter/material.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import 'UserEdit.dart';

class UserDetails extends StatefulWidget {
  final User kullanici;

  UserDetails({this.kullanici});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  void deleteProduct(context) async {
    await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/product_delete.php"),
      body: {'product_id': widget.kullanici.id.toString()},
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
        title: Text('Ürün Detayı -- [ ${widget.kullanici.name} ]'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:  Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title:  Text('${widget.kullanici.name}'),
                subtitle: Text(
                  '${widget.kullanici.lastname}',
                  style: TextStyle(fontSize:25,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.kullanici.email}',
                  style: TextStyle(fontSize:30,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.kullanici.created_at}',
                  style: TextStyle(fontSize:30,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.kullanici.country}',
                  style: TextStyle(fontSize:30,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.kullanici.city}',
                  style: TextStyle(fontSize:30,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.kullanici.address}',
                  style: TextStyle(fontSize:30,color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => UserEdit(kullanici: widget.kullanici),
          ),
        ),
      ),
    );
  }
}
