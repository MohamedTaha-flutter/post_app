import 'package:post_app/feature/post/data/data_source/post_remote_data_source.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class PostRepositoryImplement extends PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImplement(this.postRemoteDataSource);

  @override
  Future<List<GetPostEntity>> getPost() async {
    return await postRemoteDataSource.getPost();
  }
}
