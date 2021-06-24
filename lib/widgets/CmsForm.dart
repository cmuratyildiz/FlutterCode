import 'package:flutter/material.dart';

class CmsForm extends StatefulWidget {
  GlobalKey<FormState> cmsFormKey = GlobalKey<FormState>();

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

  CmsForm(
      {this.cmsFormKey,
      this.cmsTitleController,
      this.cmsTitleEnController,
      this.cmsDescriptionController,
      this.cmsUrlController,
      this.cmsMetaTitleController,
      this.cmsMetaDescriptionController,
      this.cmsMetaKeywordsController,
      this.cmsColStatusController,
      this.cmsStatusController,
      this.cmsCreatedController,
      this.cmsUpdatedController,

      });

  @override
  _CmsFormState createState() => _CmsFormState();
}

class _CmsFormState extends State<CmsForm> {
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
      key: widget.cmsFormKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.cmsTitleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Adı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsTitleEnController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Çeviri Adı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsDescriptionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Açıklama'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsUrlController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Url'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsMetaTitleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Meta Başlığı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsMetaDescriptionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Meta Açıklaması'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsMetaKeywordsController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Meta Kelimler'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsColStatusController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa konumu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsStatusController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Sayfa Statüsü '),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsCreatedController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Oluşturma Tarihi'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cmsUpdatedController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Güncelleme Tarihi'),
            validator: _validateName,
          ),
        ],
      ),
    );
  }
}
