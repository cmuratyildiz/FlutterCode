import 'package:flutter/material.dart';
import '../providers/MarkaNotifier.dart';
import 'package:provider/provider.dart';
import 'BrandsDetails.dart';

class BrandsHome extends StatefulWidget {
  BrandsHome({Key key}) : super(key: key);
  @override
  BrandsHomeState createState() => BrandsHomeState();
}

class BrandsHomeState extends State<BrandsHome> {
  MarkaNotifier markaNotifier;
  final brandsListKey = GlobalKey<BrandsHomeState>();

  @override
  void initState() {
    super.initState();
    markaNotifier = Provider.of<MarkaNotifier>(context, listen: false);
    markaNotifier.loadBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MarkaNotifier>(
      builder: (context, state, widget) {
        state.loadBrands();

        return Scaffold(
          key: brandsListKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text('MARKALAR'),
          ),
          body: state.markalar.isEmpty
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: state.loadBrands,
                  child: ListView.builder(
                    itemCount: state.markalar.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.markalar[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          trailing: Icon(Icons.view_list),
                          title: Text(
                            data.brand_name,
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BrandsDetails(marka: data)),
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
