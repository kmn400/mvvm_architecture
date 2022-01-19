import 'package:clean_architecture/domain/model/post.dart';
import 'package:clean_architecture/domain/repository/post_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final PostRepository _postRepository;

  List<Post> posts = [];
  int currentPage = 1;
  bool isLoading = false;

  HomeViewModel(this._postRepository);

  void fetch(int page) async {
    isLoading = true;
    notifyListeners();

    posts = await _postRepository.getPosts(page);
    currentPage = page;
    isLoading = false;
    notifyListeners();
  }
}
