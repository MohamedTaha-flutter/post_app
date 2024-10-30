import 'package:equatable/equatable.dart';
import 'package:post_app/feature/post/domian/entity/get_post_entity.dart';

import '../../../../../../core/error/failure.dart';

enum PostsStatus { loading, initial, error, success }

class PostState extends Equatable {
  final PostsStatus status;
  final Failure? failure;
  final List<PostEntity>? post;

  const PostState({
    this.status = PostsStatus.loading,
    this.failure,
    this.post,
  });

  PostState copyWith({
    PostsStatus? status,
    Failure? failure,
    List<PostEntity>? post,
  }) {
    return PostState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      post: post ?? this.post,
    );
  }

  @override
  List<Object?> get props => [
        status,
        failure,
        post,
      ];
}
