import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';

abstract class PostRemoteDataSource {
  Future<GetPostModel> getPost();

  Future<Unit> addPosts(Map<String, dynamic> postData);

  Future<Unit> updatePost(int id, Map<String, dynamic> updatedData);

  Future<Unit> deletePost(int id);
}

class PostRemoteDataSourceImplement implements PostRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<GetPostModel> getPost() {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPosts(Map<String, dynamic> postData) {
    // TODO: implement addPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(int id, Map<String, dynamic> updatedData) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
