import 'package:flutter/material.dart';
import '../models/Pages.dart';
import '../providers/SayfaNotifier.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widgets/env.sample.dart';
import 'CmsEdit.dart';

class CmsDetails extends StatefulWidget {
  final Pages sayfa;
  CmsDetails({this.sayfa});

  @override
  _CmsDetailsState createState() => _CmsDetailsState();
}

class _CmsDetailsState extends State<CmsDetails> {
  SayfaNotifier sayfaNotifier;

  @override
  void initState() {
    super.initState();
    sayfaNotifier = Provider.of<SayfaNotifier>(context, listen: false);
  }

  void deletePages() async {
    var response = await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/cms_delete.php"),
      body: {'id': widget.sayfa.id.toString()},
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      sayfaNotifier.deletePages(widget.sayfa.id);
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
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
                child: Icon(Icons.check_circle),
                onPressed: () {
                  Navigator.pop(context);
                  deletePages();
                }),
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
        title: Text('Sayfa Detayı -- [ ${widget.sayfa.title} ]'),
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
                title: Text('${widget.sayfa.title}'),
                subtitle: Text(
                  '${widget.sayfa.meta_title}',
                  style: TextStyle(
                      fontSize: 25, color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${widget.sayfa.description}',
                  style: TextStyle(
                      fontSize: 30, color: Colors.black.withOpacity(0.6)),
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
            builder: (BuildContext context) => CmsEdit(sayfa: widget.sayfa),
          ),
        ),
      ),
    );
  }
}
