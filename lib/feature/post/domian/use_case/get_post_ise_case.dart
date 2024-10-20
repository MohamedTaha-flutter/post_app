import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';

class GetPostUseCase {
  final PostRepository postRepository ;

  GetPostUseCase(this.postRepository);

  Future<List<GetPostEntity>> execute  () async
  {
    return await postRepository.getPost() ;
  }
}