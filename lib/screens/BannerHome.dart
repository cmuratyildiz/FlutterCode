import 'package:flutter/material.dart';
import '../providers/BannerNotifier.dart';
import 'package:provider/provider.dart';
import 'BannerDetails.dart';

class BannerHome extends StatefulWidget {
  BannerHome({Key key}) : super(key: key);
  @override
  BannerHomeState createState() => BannerHomeState();
}

class BannerHomeState extends State<BannerHome> {
  BannerNotifier bannerNotifier;
  final bannerListKey = GlobalKey<BannerHomeState>();

  @override
  void initState() {
    super.initState();
    bannerNotifier = Provider.of<BannerNotifier>(context, listen: false);
    bannerNotifier.loadBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerNotifier>(
      builder: (context, state, widget) {
        state.loadBanner();

        return Scaffold(
          key: bannerListKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text('SAYFALAR'),
          ),
          body: state.bannerlar.isEmpty
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: state.loadBanner,
                  child: ListView.builder(
                    itemCount: state.bannerlar.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.bannerlar[index];
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
                                      BannerDetails(banner: data)),
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
