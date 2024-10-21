import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/data/data_source/post_local_data_source.dart';
import 'package:post_app/feature/post/data/data_source/post_remote_data_source.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class PostRepositoryImplement extends PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;

  PostRepositoryImplement({
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
  });

  @override
  Future<Either<Failure, List<GetPostEntity>>> getPost() async {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPosts(int id) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(GetPostEntity posts) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(GetPostEntity posts) {
    // TODO: implement updatePosts
    throw UnimplementedError();
  }
}
