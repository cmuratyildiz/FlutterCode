import 'package:flutter/cupertino.dart';
import '../controller/BannerController.dart';
import '../models/Banner.dart';

class BannerNotifier extends ChangeNotifier {
  BannerNotifier(String init) {
    print(init);
  }

  List<Banners> _bannerlar = [];
  List<Banners> get bannerlar => _bannerlar;

  set bannerlar(List<Banners> value) {
    _bannerlar = value;
  }

  Future loadBanner() async {

    bannerlar = await BannerController.getBannerList();
    notifyListeners();
    return Future.value(true);
  }

  void deleteBanner(int id) {
    for (int i = 0; i < bannerlar.length; i++) {
      if (bannerlar[i].id == id) {
        bannerlar.removeAt(i);
      }
    }
    notifyListeners();
  }

  int getIndexFromId(int id) {
    for (int i = 0; i < bannerlar.length; i++) {
      if (bannerlar[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
