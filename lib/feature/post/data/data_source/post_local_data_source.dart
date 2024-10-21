import 'package:dartz/dartz.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';

abstract class PostLocalDataSource {
  Future<List<GetPostModel>> getCachePosts();

  Future<Unit> cachePosts(List<GetPostModel> postModel);
}
class PostLocalDataSourceImpl implements PostLocalDataSource {
  @override
  Future<Unit> cachePosts(List<GetPostModel> postModel) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<GetPostModel>> getCachePosts() {
    // TODO: implement getCachePosts
    throw UnimplementedError();
  }
}