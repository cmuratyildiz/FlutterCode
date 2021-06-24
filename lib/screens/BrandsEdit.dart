import 'package:flutter/material.dart';
import '../controller/BrandController.dart';
import '../models/Brands.dart';
import '../providers/MarkaNotifier.dart';
import 'package:provider/provider.dart';
import '../widgets/BrandForm.dart';

class BrandsEdit extends StatefulWidget {
  final Brands marka;

  BrandsEdit({this.marka});

  @override
  _BrandsEditState createState() => _BrandsEditState();
}

class _BrandsEditState extends State<BrandsEdit> {
  final formKey = GlobalKey<FormState>();
  MarkaNotifier markaNotifier;

  TextEditingController brandNameController;
  TextEditingController brandSlugController;
  TextEditingController brandStatusController;


  @override
  void initState() {
    super.initState();
    markaNotifier = Provider.of<MarkaNotifier>(context, listen: false);
    brandNameController = TextEditingController(text: widget.marka.brand_name);
    brandSlugController = TextEditingController(text: widget.marka.brand_slug);
    brandStatusController = TextEditingController(text: widget.marka.status);
  }

  @override
  void dispose() {
    super.dispose();
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
          onPressed: () async {
            print(widget.marka.toJson());
          bool  ret= await BrandController.updateBrand(Brands(
                brand_id: widget.marka.brand_id,
                brand_name: brandNameController.text,
                brand_slug: brandSlugController.text,
                status: brandStatusController.text));

          if(ret){
            Navigator.pop(context);
          }
            /*
            markaNotifier.updateBrands(widget.marka.brand_id).then((value){
              if(value){
                Navigator.pop(context);
              }
            });
             */
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: BrandForm(
              brandFormKey: formKey,
              brandNameController: brandNameController,
              brandSlugController: brandSlugController,
              brandStatusController: brandStatusController,
            ),
          ),
        ),
      ),
    );
  }
}
