import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

abstract class PostRepository {


  Future<Either<Failure, List<PostEntity>>> getPost();

  Future<Either<Failure, Unit>> addPosts(PostEntity posts);

  Future<Either<Failure, Unit>> deletePosts(int postsId);

  Future<Either<Failure, Unit>> updatePosts(PostEntity posts);
}
