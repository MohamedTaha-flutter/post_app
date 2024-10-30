import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/exception.dart';
import 'package:post_app/feature/post/data/model/get_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachePosts();

  Future<Unit> cachePosts(List<PostModel> postModel);
}

const String cachePost = "CACHE_POSTS" ;

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(cachePost, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachePosts() {
    final jsonString = sharedPreferences.getString(cachePost);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> postModelToJson = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(postModelToJson);
    } else {
      throw EmptyCacheException();
    }
  }
}
