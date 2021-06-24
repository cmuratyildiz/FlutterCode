import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../widgets/env.sample.dart';
import '../widgets/form.dart';

class Create extends StatefulWidget {
  final Function refreshStudentList;

  Create({this.refreshStudentList});

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();

  TextEditingController categoryNameController = new TextEditingController();
  TextEditingController categoryDescriptionController =
      new TextEditingController();
  TextEditingController categoryUrlController = new TextEditingController();

  Future<Response> _createCategory() async {
    final url = Uri.parse('${SiteImageLink.URL_PREFIX}/category_create.php');
    return await http.post(
      url,
      body: {
        "category_name": categoryNameController.text,
        "category_description": categoryDescriptionController.text,
        "category_url": categoryUrlController.text,
      },
    );
  }

  void _onConfirm(context) async {
    Response create = await _createCategory();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Kategori"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          //raised kalkıcak
          child: Text("Kategoriyi ekle"),
          onPressed: () {
            if (formKey.currentState.validate()) {
              _onConfirm(context);
            }
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
              formKey: formKey,
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
