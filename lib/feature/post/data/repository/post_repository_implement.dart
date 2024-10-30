import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/exception.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/network/network_info.dart';
import 'package:post_app/feature/post/data/data_source/post_local_data_source.dart';
import 'package:post_app/feature/post/data/data_source/post_remote_data_source.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource _postRemoteDataSource;
  final PostLocalDataSource _postLocalDataSource;
  final NetworkInfo _networkInfo;

  PostRepositoryImpl(
      this._postRemoteDataSource, this._postLocalDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<PostEntity>>> getPost() async {
    if (await _networkInfo.isConnected) {
      try {
        final remotePosts = await _postRemoteDataSource.getPost();
        _postLocalDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await _postLocalDataSource.getCachePosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPosts(PostEntity posts) async {
    PostModel postModel = PostModel(
      id: posts.id,
      title: posts.title,
      body: posts.body,
    );
    if (await _networkInfo.isConnected) {
      try {
        await _postRemoteDataSource.addPosts(postModel);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePosts(int postsId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _postRemoteDataSource.deletePost(postsId);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePosts(PostEntity posts) async {
    PostModel postModel = PostModel(
      id: posts.id,
      title: posts.title,
      body: posts.body,
    );
    if (await _networkInfo.isConnected) {
      try {
        await _postRemoteDataSource.updatePost(postModel);
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
