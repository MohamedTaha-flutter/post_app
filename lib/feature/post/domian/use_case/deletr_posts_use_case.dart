import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class DeletePostsUseCase {
  final PostRepository postRepository;

  DeletePostsUseCase(this.postRepository);

  Future<Either<Failure, Unit>> execute(int postsId) async {
    return await postRepository.deletePosts(postsId);
  }
}
