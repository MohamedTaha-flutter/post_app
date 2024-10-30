import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/core/error/exception.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPost();
  Future<Unit> addPosts(PostModel postData);
  Future<Unit> updatePost(PostModel updatedData);
  Future<Unit> deletePost(int id);
}

final String baseUrl = 'https://jsonplaceholder.typicode.com';
final String getEndPoint = '/posts/';

class PostRemoteDataSourceImplement implements PostRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<PostModel>> getPost() async {
    try {
      final response = await _dio.get("$baseUrl$getEndPoint",
          options: Options(
            headers: {
              'Content-type': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        final List<PostModel> posts = (response.data as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
        return posts;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw Exception('Failed to load posts: ${e.message}');
    }
  }

  @override
  Future<Unit> addPosts(PostModel postData) async {
    final data = {
      "title": postData.title,
      "body": postData.body,
    };
    try {
      final response = await _dio.post(
        "$baseUrl/posts",
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw Exception('Failed to add post: ${e.message}');
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    try {
      final response = await _dio.delete(
        "$baseUrl/posts/$id",
        options: Options(
          headers: {
            'Content-type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete post: ${e.message}');
    }
  }

  @override
  Future<Unit> updatePost(PostModel updatedData) async {
    final postId = updatedData.id.toString();
    final data = {
      "title": updatedData.title,
      "body": updatedData.body,
    };
    try {
      final response = await _dio.put(
        '$baseUrl/posts/$postId',
        data: data,
        options: Options(
          headers: {
            'Content-type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return Future.value(unit);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw Exception('Failed to update post: ${e.message}');
    }
  }
}
