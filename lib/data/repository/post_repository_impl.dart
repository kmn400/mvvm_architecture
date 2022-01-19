import 'package:clean_architecture/data/data_source/remote/post_remote_data_source.dart';
import 'package:clean_architecture/domain/model/post.dart';
import 'package:clean_architecture/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource _dataSource;
  final int pageLimit = 10;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getAllPosts() {
    return _dataSource.getAllPosts();
  }

  Future<List<Post>> getPosts(int page) async {
    return await _dataSource.getPosts(page, pageLimit);
  }
}
