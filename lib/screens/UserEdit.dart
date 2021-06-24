import 'package:flutter/material.dart';
import '../models/User.dart';
import '../widgets/UserForm.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class UserEdit extends StatefulWidget {
  final User kullanici;

  UserEdit({this.kullanici});

  @override
  _UserEditState createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final formKey = GlobalKey<FormState>();

  TextEditingController NameController;
  TextEditingController lastController;
  TextEditingController emailController;

  Future<Response> editProduct(User kullanici) async {
    kullanici.name = NameController.text;
    kullanici.lastname = lastController.text;
    kullanici.email = emailController.text;
    Map body = kullanici.toJson();

    return await http.post(
        Uri.parse("${SiteLink.URL_PREFIX}/brand_update.php"),
        body: body);
  }

  void _onConfirm(context) async {
    Response edit = await editProduct(widget.kullanici);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    NameController =
        TextEditingController(text: widget.kullanici.name);
    lastController =
        TextEditingController(text: widget.kullanici.lastname);
    emailController = TextEditingController(text: widget.kullanici.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marka Düzenle"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          child: Text('Düzenlemeyi onayla'),
          onPressed: () {
            print(widget.kullanici.toJson());
            _onConfirm(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: UserForm(
              userFormKey: formKey,
              NameController: NameController,
              lastnameController: lastController,
              emailController: emailController,
            ),
          ),
        ),
      ),
    );
  }
}
