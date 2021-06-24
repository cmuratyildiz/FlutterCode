import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  GlobalKey<FormState> productFormKey = GlobalKey<FormState>();

  TextEditingController categoryIDdController;
  TextEditingController productNameController;
  TextEditingController productCodeController;
  TextEditingController Code2Controller;
  TextEditingController SlugController;
  TextEditingController SizeController;
  TextEditingController DescriptionController;
  TextEditingController MetaTitleController;
  TextEditingController MetaDescriptionController;
  TextEditingController PriceController;
  TextEditingController dicountPriceController;
  TextEditingController salesPriceController;
  TextEditingController KdvController;
  TextEditingController discountRateController;
  TextEditingController StockController;
  TextEditingController weightController;
  TextEditingController imageController;
  TextEditingController featureItemController;
  TextEditingController statusController;
  TextEditingController showcaseController;
  TextEditingController createdAtController;
  TextEditingController updateAtController;

  ProductForm(
      {this.productFormKey,
      this.categoryIDdController,
      this.productNameController,
      this.productCodeController,
      this.Code2Controller,
      this.SlugController,
      this.SizeController,
      this.DescriptionController,
      this.MetaTitleController,
      this.MetaDescriptionController,
      this.PriceController,
      this.dicountPriceController,
      this.salesPriceController,
      this.KdvController,
      this.discountRateController,
      this.StockController,
      this.weightController,
      this.imageController,
      this.featureItemController,
      this.statusController,
      this.showcaseController,
      this.createdAtController,
      this.updateAtController});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
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
      key: widget.productFormKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.categoryIDdController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Kategori Numarası'),
            validator: _validateAge,
          ),
          TextFormField(
            controller: widget.productNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Ürün Adı'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.productCodeController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.Code2Controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.SlugController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.SizeController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.DescriptionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.MetaTitleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.MetaDescriptionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.PriceController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.dicountPriceController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.salesPriceController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.KdvController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.discountRateController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.StockController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.weightController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.imageController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.featureItemController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.statusController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.showcaseController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.createdAtController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
          TextFormField(
            controller: widget.updateAtController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Marka Link yolu'),
            validator: _validateName,
          ),
        ],
      ),
    );
  }
}
