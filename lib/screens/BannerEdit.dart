import 'package:flutter/material.dart';
import '../widgets/BannerForm.dart';
import '../models/Banner.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class BannerEdit extends StatefulWidget {
  final Banners banner;

  BannerEdit({this.banner});

  @override
  _BannerEditState createState() => _BannerEditState();
}

class _BannerEditState extends State<BannerEdit> {
  final bannerFormKey = GlobalKey<FormState>();

  TextEditingController bannerImageController;
  TextEditingController bannerTitleController;
  TextEditingController bannerStatusController;

  Future<Response> editCategory(Banners banner) async {
    banner.title = bannerTitleController.text;
    banner.status = bannerStatusController.text;
    banner.image = bannerImageController.text;
    Map body = banner.toJson();

    return await http.post(
        Uri.parse("${SiteLink.URL_PREFIX}/banner_update.php"),
        body: body);
  }

  void _onConfirm(context) async {
    Response edit = await editCategory(widget.banner);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    bannerTitleController = TextEditingController(text: widget.banner.title);
    bannerImageController = TextEditingController(text: widget.banner.image);
    bannerStatusController= TextEditingController(text: widget.banner.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banner Düzenle"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('Düzenlemeyi onayla'),
          onPressed: () {
            print(widget.banner.toJson());
            _onConfirm(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: BannerForm(
              bannerFormKey: bannerFormKey,
              bannerImageController: bannerImageController,
              bannerTitleController: bannerTitleController,
              bannerStatusController: bannerStatusController,
            ),
          ),
        ),
      ),
    );
  }
}
