import 'package:flutter/material.dart';
import '../models/Pages.dart';
import '../widgets/CmsForm.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CmsEdit extends StatefulWidget {
  final Pages sayfa;

  CmsEdit({this.sayfa});

  @override
  _CmsEditState createState() => _CmsEditState();
}

class _CmsEditState extends State<CmsEdit> {
  final cmsformKey = GlobalKey<FormState>();

  TextEditingController cmsTitleController;
  TextEditingController cmsTitleEnController;
  TextEditingController cmsDescriptionController;
  TextEditingController cmsUrlController;
  TextEditingController cmsMetaTitleController;
  TextEditingController cmsMetaDescriptionController;
  TextEditingController cmsMetaKeywordsController;
  TextEditingController cmsColStatusController;
  TextEditingController cmsStatusController;
  TextEditingController cmsCreatedController;
  TextEditingController cmsUpdatedController;

  Future<Response> editProduct(Pages sayfa) async {
    sayfa.title = cmsTitleController.text;
    sayfa.title_en = cmsTitleEnController.text;
    sayfa.description = cmsDescriptionController.text;
    sayfa.url = cmsUrlController.text;
    sayfa.meta_title = cmsMetaTitleController.text;
    sayfa.meta_description = cmsMetaDescriptionController.text;
    sayfa.meta_keywords = cmsMetaKeywordsController.text;
    sayfa.col_status = cmsColStatusController.text;
    sayfa.status = cmsStatusController.text;
    sayfa.created_at = cmsCreatedController.text;
    sayfa.updated_at = cmsUpdatedController.text;
    Map body = sayfa.toJson();

    return await http.post(Uri.parse("${SiteLink.URL_PREFIX}/cms_update.php"),
        body: body);
  }

  void _onConfirm(context) async {
    Response edit = await editProduct(widget.sayfa);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    cmsTitleController = TextEditingController(text: widget.sayfa.title);
    cmsTitleEnController = TextEditingController(text: widget.sayfa.title_en);
    cmsDescriptionController = TextEditingController(text: widget.sayfa.description);
    cmsUrlController = TextEditingController(text: widget.sayfa.url);
    cmsMetaTitleController = TextEditingController(text: widget.sayfa.meta_title);
    cmsMetaDescriptionController = TextEditingController(text: widget.sayfa.meta_description);
    cmsMetaKeywordsController = TextEditingController(text: widget.sayfa.meta_keywords);
    cmsColStatusController = TextEditingController(text: widget.sayfa.col_status);
    cmsStatusController = TextEditingController(text: widget.sayfa.status);
    cmsCreatedController = TextEditingController(text: widget.sayfa.created_at);
    cmsUpdatedController = TextEditingController(text: widget.sayfa.updated_at);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa Düzenle"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('Düzenlemeyi onayla'),
          // color: Colors.blue,
          //textColor: Colors.white,
          onPressed: () {
            print(widget.sayfa.toJson());
            _onConfirm(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CmsForm(
              cmsFormKey: cmsformKey,
              cmsTitleController: cmsTitleController,
              cmsTitleEnController: cmsTitleEnController,
              cmsDescriptionController: cmsDescriptionController,
              cmsUrlController: cmsUrlController,
              cmsMetaTitleController: cmsMetaTitleController,
              cmsMetaDescriptionController:cmsMetaDescriptionController,
              cmsMetaKeywordsController:cmsMetaKeywordsController,
              cmsColStatusController:cmsColStatusController,
              cmsStatusController:cmsStatusController,
              cmsCreatedController:cmsCreatedController,
              cmsUpdatedController:cmsUpdatedController,
            ),
          ),
        ),
      ),
    );
  }
}
