import 'package:flutter/material.dart';

class BannerForm extends StatefulWidget {

  GlobalKey<FormState> bannerFormKey = GlobalKey<FormState>();

  TextEditingController bannerImageController;
  TextEditingController bannerTitleController;
  TextEditingController bannerStatusController;

  BannerForm({this.bannerFormKey, this.bannerImageController, this.bannerTitleController, this.bannerStatusController});

  @override
  _BannerFormState createState() => _BannerFormState();
}

class _BannerFormState extends State<BannerForm> {
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
      key: widget.bannerFormKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.bannerImageController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Banner Resmi'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.bannerTitleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Banner Başlığı'),
            validator: _validateName,
          ),
         TextFormField(
            controller: widget.bannerStatusController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Banner Durumu'),
            validator: _validateAge,
          ),
        ],
      ),
    );
  }
}