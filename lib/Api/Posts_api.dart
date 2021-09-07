import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_application/Models/Post.dart';
import 'package:news_application/utilities/api_utilities.dart';

class Posts_api {
  List<Post> posts = <Post>[];
  Future<List<Post>> fetchAllPosts() async {
    Uri posts_api_url = Uri.parse(base_api + all_posts_api);
    var response = await http.get(posts_api_url);

    if (response.statusCode == 200){
      var Jsondata = jsonDecode(response.body);
      var data = Jsondata["data"];
      for (var item in data){
        Post post = Post(item['id'].toString(),item['title'].toString(),item['content'].toString(),item['featured_image'].toString(),item['date_written'].toString(),item['vote_up'].toString(),item['vote_down'].toString(),item['user_id'].toString(),item['category_id'].toString());
        posts.add(post);
        print(post.toString());
      }
    }
    return (posts);
  }
}