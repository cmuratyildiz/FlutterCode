import 'package:flutter/material.dart';
import '../models/Category.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Category kategori;

  Edit({this.kategori});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final kategoriFormKey = GlobalKey<FormState>();

  TextEditingController categoryNameController;
  TextEditingController categoryDescriptionController;
  TextEditingController categoryUrlController;

  Future<Response> editCategory(Category kategori) async {
    kategori.name = categoryNameController.text;
    kategori.description = categoryDescriptionController.text;
    kategori.url = categoryUrlController.text;
    Map body = kategori.toJson();

    return await http.post(
        Uri.parse("${SiteLink.URL_PREFIX}/category_update.php"),
        body: body);
  }

  void _onConfirm(context) async {
    Response edit = await editCategory(widget.kategori);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    categoryNameController =
        TextEditingController(text: widget.kategori.name);
    categoryDescriptionController =
        TextEditingController(text: widget.kategori.description);
    categoryUrlController =
        TextEditingController(text: widget.kategori.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Düzenle"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('Düzenlemeyi onayla'),
          onPressed: () {
            print(widget.kategori.toJson());
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
            child: AppForm(
              formKey: kategoriFormKey,
              categoryNameController: categoryNameController,
              categoryDescriptionController: categoryDescriptionController,
              categoryUrlController: categoryUrlController,
            ),
          ),
        ),
      ),
    );
  }
}
