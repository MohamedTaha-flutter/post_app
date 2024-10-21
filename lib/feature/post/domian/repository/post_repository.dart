import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<GetPostEntity>>> getPost();

  Future<Either<Failure, Unit>> addPosts(int id);

  Future<Either<Failure, Unit>> deletePosts(GetPostEntity posts);

  Future<Either<Failure, Unit>> updatePosts(GetPostEntity posts);
}
