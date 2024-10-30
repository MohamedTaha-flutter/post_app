import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class GetPostUseCase {
  final PostRepository postRepository ;

  GetPostUseCase(this.postRepository);

  Future<Either<Failure, List<PostEntity>>> execute  () async
  {
    return await postRepository.getPost() ;
  }
}