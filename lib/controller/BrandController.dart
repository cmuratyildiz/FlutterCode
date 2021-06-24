import 'dart:convert';

import '../models/Brands.dart';
import '../widgets/env.sample.dart';
import 'package:http/http.dart' as http;

class BrandController {
  static Future<List<Brands>> getBrandsList() async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/brand_list.php');
    final response = await http.get(url);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Brands> markalar = items.map<Brands>((json) {
      return Brands.fromJson(json);
    }).toList();

    return markalar;
  }

  static Future<bool> updateBrand(Brands brand) async {
    final url = Uri.parse('${SiteLink.URL_PREFIX}/brand_update.php');

    String data = json.encode(brand);
    print(data);
    final response = await http.post(url, body: data);
    print(response.body);
    if(response.statusCode==200){
      print(response.statusCode);
      return true;
    }
    return false;
  }
}
