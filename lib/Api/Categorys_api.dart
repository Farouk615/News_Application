import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_application/utilities/api_utilities.dart';
import 'package:news_application/Models/Category.dart';

class Categorys_api{

  Future<List<Category>> fetchAllCategorys() async {
    List<Category> categories = <Category>[];
    var categories_api_url = Uri.parse(base_api + all_categories_api);
    var response = await http.get(categories_api_url);
    if (response.statusCode == 200){
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];
      for (var item in data){
        Category category = Category(item['id'].toString(),item['title'].toString());
        categories.add(category);
      }
    }
    return categories;
  }
}