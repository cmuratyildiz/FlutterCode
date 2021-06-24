import 'package:flutter/material.dart';

class BrandForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> brandFormKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController brandNameController;
  TextEditingController brandSlugController;
  TextEditingController brandStatusController;

  BrandForm({this.brandFormKey, this.brandNameController, this.brandSlugController, this.brandStatusController});

  @override
  _BrandFormState createState() => _BrandFormState();
}

class _BrandFormState extends State<BrandForm> {
  String _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }

  String _validateAge(String value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Sayı girmeniz gerekmektedir!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.brandFormKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.brandNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Adı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.brandSlugController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
         TextFormField(
            controller: widget.brandStatusController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Durum'),
          ),
        ],
      ),
    );
  }
}