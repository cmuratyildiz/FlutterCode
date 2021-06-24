import 'dart:convert';
import '../models/Banner.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;


  class BannerController {

    static Future<List<Banners>> getBannerList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/banner_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Banners> bannerlar = items.map<Banners>((json) {
    return Banners.fromJson(json);
    }).toList();

    return bannerlar;
      }

  }


  /*static Future<bool> updateBrand(Brands brand) async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/brand_update.php');

    String data = json.encode(brand);
    final response = await http.post(url, body: data);
    if(response.statusCode==200){
      return true;
    }

    return false;
  }
}*/
