import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_application/Models/author.dart';
import 'package:news_application/utilities/api_utilities.dart';

class Authors_api {
  List<Author> authors = <Author>[];
  Future<List<Author>> fetchAllAuthors() async {
    Uri authors_api_url = Uri.parse(base_api + all_authors_api);
    var response = await http.get(authors_api_url);

    if (response.statusCode == 200){
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];
      for (var item in data){
        Author author = Author(item['id'].toString(),item['name'].toString(),item['email'].toString(),item['avatar'].toString());
        authors.add(author);
        print(author.name);
      }
    }
    return (authors);
  }
}