import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

class GetPostModel extends GetPostEntity {
  GetPostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  factory GetPostModel.fromJson(Map<String, dynamic> json) {
    return GetPostModel(
      userId: json['userId'],
      id: json['id:'],
      title: json['title'],
      body: json['body'],
    );
  }
}
