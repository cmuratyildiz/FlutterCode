import 'dart:convert';

import '../models/Pages.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;


  class PagesController {

    static Future<List<Pages>> getCmsList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/cms_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Pages> sayfalar = items.map<Pages>((json) {
    return Pages.fromJson(json);
    }).toList();

    return sayfalar;
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
