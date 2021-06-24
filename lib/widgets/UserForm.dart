import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  GlobalKey<FormState> userFormKey = GlobalKey<FormState>();

  TextEditingController IDdController;
  TextEditingController NameController;
  TextEditingController lastnameController;
  TextEditingController addressController;
  TextEditingController cityController;
  TextEditingController stateController;
  TextEditingController countryController;
  TextEditingController mobileController;
  TextEditingController emailController;
  TextEditingController statusController;
  TextEditingController created_atController;


  UserForm(
      {this.userFormKey,
      this.IDdController,
      this.NameController,
      this.lastnameController,
      this.addressController,
      this.cityController,
      this.stateController,
      this.countryController,
      this.mobileController,
      this.emailController,
      this.statusController,
      this.created_atController,
 });

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String _validateName(String value) {
    if (value.length < 3) return 'En az 2 harf giriniz';
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
      key: widget.userFormKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[

          TextFormField(
            controller: widget.NameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Adı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.lastnameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Soyad'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Email'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.addressController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'adres'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.cityController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'şehir'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.stateController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'cadde'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.countryController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'ülke'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.statusController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Durum'),
            validator: _validateName,
          ),
        ],
      ),
    );
  }
}
