import 'package:flutter/material.dart';
import '../screens/CmsDetails.dart';
import 'package:provider/provider.dart';
import '../providers/SayfaNotifier.dart';

class CmsHome extends StatefulWidget {
  CmsHome({Key key}) : super(key: key);
  @override
  CmsHomeState createState() => CmsHomeState();
}

class CmsHomeState extends State<CmsHome> {
  SayfaNotifier sayfaNotifier;
  final cmsListKey = GlobalKey<CmsHomeState>();

  @override
  void initState() {
    super.initState();
    sayfaNotifier = Provider.of<SayfaNotifier>(context, listen: false);
    sayfaNotifier.loadPages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SayfaNotifier>(
      builder: (context, state, widget) {
        state.loadPages();

        return Scaffold(
          key: cmsListKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text('SAYFALAR'),
          ),
          body: state.sayfalar.isEmpty
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: state.loadPages,
                  child: ListView.builder(
                    itemCount: state.sayfalar.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.sayfalar[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          trailing: Icon(Icons.view_list),
                          title: Text(
                            data.title,
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CmsDetails(sayfa: data)),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) {}));
            },
          ),
        );
      },
    );
  }
}
