import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

class GetPostModel extends GetPostEntity {
  const GetPostModel({
    required super.id,
    required super.title,
    required super.body,
  });

  factory GetPostModel.fromJson(Map<String, dynamic> json) {
    return GetPostModel(
      id: json['id:'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }
}
