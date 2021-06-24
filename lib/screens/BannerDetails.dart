import 'package:flutter/material.dart';
import '../providers/BannerNotifier.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../widgets/env.sample.dart';
import '../models/Banner.dart';
import 'BannerEdit.dart';


class BannerDetails extends StatefulWidget {
  final Banners banner;
  BannerDetails({this.banner});

  @override
  _BannerDetailsState createState() => _BannerDetailsState();
}

class _BannerDetailsState extends State<BannerDetails> {

  BannerNotifier bannerNotifier;

  @override
  void initState() {
    super.initState();
    bannerNotifier = Provider.of<BannerNotifier>(context,listen: false);
  }

  void deleteBanner() async {
    var response=  await http.post(
      Uri.parse("${SiteLink.URL_PREFIX}/banner_delete.php"),
      body: {
        'id': widget.banner.id.toString(),
      },
    );

    print(response.statusCode);
    if(response.statusCode==200){
      bannerNotifier.deleteBanner(widget.banner.id);
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
                  deleteBanner();
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
        title: Text('Banner Detayı'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children:<Widget>[
              new Container(
                height: 200.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new NetworkImage('${SiteBannerImageLink.URL_PREFIX}/${widget.banner.image}'),
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
                "Resim yolu url : ${widget.banner.image}",
                style: TextStyle(fontSize: 20),
              ),

              Padding(
                padding: EdgeInsets.all(20),
              ),

              Text(
                "Banner Başlık : ${widget.banner.title}",
                style: TextStyle(fontSize: 20),
              ),

              Padding(
                padding: EdgeInsets.all(20),
              ),

              Text(
                "Banner Durumu : ${widget.banner.status}",
                style: TextStyle(fontSize: 20),
              ),

              Padding(
                padding: EdgeInsets.all(20),
              ),

            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => BannerEdit(banner: widget.banner),
          ),
        ),
      ),
    );
  }
}