import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/feature/post/domian/use_case/get_post_ise_case.dart';
import 'package:post_app/feature/post/presentation/controller/cubit/post_state.dart';

class PostsCubit extends Cubit<PostState> {
  final GetPostUseCase getPostUseCase;

  PostsCubit(this.getPostUseCase) : super(PostState());

  Future<void> getAllPosts() async {
    emit(state.copyWith(status: PostsStatus.loading));
    final response = await getPostUseCase.execute();
    response.fold(
          (failure) => emit(state.copyWith(status: PostsStatus.error, failure: failure)),
          (posts) => emit(state.copyWith(status: PostsStatus.success, post: posts)),
    );
  }
}
