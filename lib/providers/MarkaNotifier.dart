import 'package:flutter/cupertino.dart';
import '../controller/BrandController.dart';
import '../models/Brands.dart';

class MarkaNotifier extends ChangeNotifier {
  MarkaNotifier(String init) {
    print(init);
  }

  List<Brands> _markalar = [];
  List<Brands> get markalar => _markalar;

  set markalar(List<Brands> value) {
    _markalar = value;
  }

  Future loadBrands() async {

    markalar = await BrandController.getBrandsList();
    notifyListeners();
    return Future.value(true);
  }

  void deleteBrands(int id) {
    for (int i = 0; i < markalar.length; i++) {
      if (markalar[i].brand_id == id) {
        markalar.removeAt(i);
      }
    }
    notifyListeners();
  }

  int getIndexFromId(int id) {
    for (int i = 0; i < markalar.length; i++) {
      if (markalar[i].brand_id == id) {
        return i;
      }
    }
    return -1;
  }

  Future<bool> updateBrands(int id) async {
    return BrandController.updateBrand(markalar[getIndexFromId(id)]);
  }
}
