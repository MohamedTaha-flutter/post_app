import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class UpdatePostsUseCase {
  final PostRepository postRepository;

  UpdatePostsUseCase(this.postRepository);

  Future<Either<Failure, Unit>>  execute(PostEntity posts) async {
    return await postRepository.updatePosts(posts);
  }
}
