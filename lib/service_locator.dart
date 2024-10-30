import 'package:get_it/get_it.dart';
import 'package:post_app/feature/post/data/data_source/post_local_data_source.dart';
import 'package:post_app/feature/post/data/data_source/post_remote_data_source.dart';
import 'package:post_app/feature/post/data/repository/post_repository_implement.dart';
import 'package:post_app/feature/post/domian/repository/post_repository.dart';
import 'package:post_app/feature/post/domian/use_case/get_post_ise_case.dart';
import 'package:post_app/feature/post/presentation/controller/cubit/post_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Registering Remote Data Source
    sl.registerLazySingleton<PostRemoteDataSource>(
            () => PostRemoteDataSourceImplement());

    // Registering Local Data Source
    sl.registerLazySingleton<PostLocalDataSource>(
            () => PostLocalDataSourceImpl(sl()));

    // Registering Repository
    sl.registerLazySingleton<PostRepository>(
            () => PostRepositoryImpl(sl(), sl(), sl()));

    // Registering Use Cases
    sl.registerLazySingleton<GetPostUseCase>(
            () => GetPostUseCase(sl()));

    // Registering Cubit
    sl.registerFactory<PostsCubit>(() => PostsCubit(sl()));
  }
}
