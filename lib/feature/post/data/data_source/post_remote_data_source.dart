import 'package:dio/dio.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<GetPostModel>> getPost();
}

class PostRemoteDataSourceImplement implements PostRemoteDataSource {
  @override
  Future<List<GetPostModel>> getPost() async {
    try {
      final response =
      await Dio().get("https://jsonplaceholder.typicode.com/posts");

      if (response.statusCode == 200) {
        return List<GetPostModel>.from(
            (response.data as List).map((e) => GetPostModel.fromJson(e)));
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
