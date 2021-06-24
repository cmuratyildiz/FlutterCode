import 'package:flutter/material.dart';
import '../models/Brands.dart';
import '../providers/MarkaNotifier.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widgets/env.sample.dart';
import 'BrandsEdit.dart';

class BrandsDetails extends StatefulWidget {
  final Brands marka;
  BrandsDetails({this.marka});

  @override
  _BrandsDetailsState createState() => _BrandsDetailsState();
}

class _BrandsDetailsState extends State<BrandsDetails> {

  MarkaNotifier markaNotifier;

  @override
  void initState() {
    super.initState();
    markaNotifier = Provider.of<MarkaNotifier>(context,listen: false);
  }

  void deleteBrands() async {
  var response=  await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/brand_delete.php"),
      body: {
        'brand_id': widget.marka.brand_id.toString()
      },
    );

  print(response.statusCode);
  if(response.statusCode==200){
    markaNotifier.deleteBrands(widget.marka.brand_id);
    Navigator.pop(context);
    }
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
              onPressed: (){
                Navigator.pop(context);
                deleteBrands();
              }
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
        title: Text('Marka Detayı'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title:  Text('${widget.marka.brand_name}'),
                subtitle: Text(
                  '${widget.marka.brand_slug}',
                  style: TextStyle(fontSize:25,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.marka.status}',
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
            builder: (BuildContext context) => BrandsEdit(marka: widget.marka),
          ),
        ),
      ),
    );
  }
}
