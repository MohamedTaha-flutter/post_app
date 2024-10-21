import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class AddPostsUseCase {
  final PostRepository postRepository ;

  AddPostsUseCase(this.postRepository);

  Future<Either<Failure, Unit>>  execute  ( int id) async
  {
    return await postRepository.addPosts(id ) ;
  }
}