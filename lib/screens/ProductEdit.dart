import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/ProductForm.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductEdit extends StatefulWidget {
  final Product urun;

  ProductEdit({this.urun});

  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final formKey = GlobalKey<FormState>();

  TextEditingController brandNameController;
  TextEditingController brandSlugController;
  TextEditingController brandsStatusController;

  Future<Response> editProduct(Product urun) async {
    urun.category_id = brandNameController.text;
    urun.product_name = brandSlugController.text;
    urun.status = brandsStatusController.text;
    Map body = urun.toJson();

    return await http.post(Uri.parse("${SiteLink.URL_PREFIX}/brand_update.php"),
        body: body);
  }

  void _onConfirm(context) async {
    Response edit = await editProduct(widget.urun);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    brandNameController = TextEditingController(text: widget.urun.product_name);
    brandSlugController = TextEditingController(text: widget.urun.category_id);
    brandsStatusController = TextEditingController(text: widget.urun.status);
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
          // color: Colors.blue,
          //textColor: Colors.white,
          onPressed: () {
            print(widget.urun.toJson());
            _onConfirm(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ProductForm(
              productFormKey: formKey,
              categoryIDdController: brandNameController,
              productNameController: brandSlugController,
            ),
          ),
        ),
      ),
    );
  }
}
