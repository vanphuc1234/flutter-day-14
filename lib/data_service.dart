import 'package:http/http.dart' as http;
import 'dart:convert';

import 'post_modal.dart';

class DataService {
  final baseUrl = 'jsonplaceholder.typicode.com';

  // function get JSON data
  Future<List<Post>> getPosts() async {
    try {
      final url = Uri.https(baseUrl, '/posts');
      final response = await http.get(url);
      final json = jsonDecode(response.body) as List;
      final posts = json.map((postJson) => Post.fromJson(postJson)).toList();
      return posts;
    } catch (e) {
      throw (e);
    }
  }
}
