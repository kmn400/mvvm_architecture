import 'package:clean_architecture/domain/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();

  Future<List<Post>> getPosts(int page);
}
