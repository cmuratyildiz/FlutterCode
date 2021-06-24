import 'package:flutter/cupertino.dart';
import '../controller/PagesController.dart';
import '../models/Pages.dart';

class SayfaNotifier extends ChangeNotifier {
  SayfaNotifier(String init) {
    print(init);
  }

  List<Pages> _sayfalar = [];
  List<Pages> get sayfalar => _sayfalar;

  set sayfalar(List<Pages> value) {
    _sayfalar = value;
  }

  Future loadPages() async {

    sayfalar = await PagesController.getCmsList();
    notifyListeners();
    return Future.value(true);
  }

  void deletePages(int id) {
    for (int i = 0; i < sayfalar.length; i++) {
      if (sayfalar[i].id == id) {
        sayfalar.removeAt(i);
      }
    }
    notifyListeners();
  }

  int getIndexFromId(int id) {
    for (int i = 0; i < sayfalar.length; i++) {
      if (sayfalar[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
