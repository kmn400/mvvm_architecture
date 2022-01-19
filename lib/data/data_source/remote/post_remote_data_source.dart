import 'dart:convert';

import 'package:clean_architecture/domain/model/post.dart';
import 'package:http/http.dart' as http;

class PostRemoteDataSource {
  final http.Client _client;

  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  PostRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  Future<List<Post>> getAllPosts() async {
    final response = await _client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Post>> getPosts(int page, int limit) async {
    final response = await _client
        .get(Uri.parse('$baseUrl/posts?_page=$page&_limit=$limit'));

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
