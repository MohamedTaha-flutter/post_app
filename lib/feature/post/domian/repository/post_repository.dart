import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

abstract class PostRepository {
  Future<List<GetPostEntity>> getPost();
}
