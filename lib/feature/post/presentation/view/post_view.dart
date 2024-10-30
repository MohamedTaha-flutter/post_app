import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/feature/post/presentation/controller/cubit/post_cubit.dart';
import 'package:post_app/feature/post/presentation/controller/cubit/post_state.dart';
import 'package:post_app/service_locator.dart';
import 'package:post_app/feature/post/domian/use_case/get_post_ise_case.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
   late GetPostUseCase getPostUseCase;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<PostsCubit>(
      create: (context) => PostsCubit(getPostUseCase)..getAllPosts(),
      child: BlocBuilder<PostsCubit, PostState>(
        builder: (context, state) {
          if (state.status == PostsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == PostsStatus.error) {
            return const Center(child: Text('Error loading movies'));
          }

          if (state.post == null || state.post!.isEmpty) {
            return const Center(child: Text('No movies available'));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Movies List"),
            ),
            body: Column(
              children: [
                Center(
                  child: Text(
                    state.post![0].title,
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GetPostUseCase>('getPostUseCase', getPostUseCase));
  }
}
