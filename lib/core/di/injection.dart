import '../../data/repo/post_repo.dart';
import '../../data/web_services/web_services.dart';
import '../../view_model/cubit/post_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<PostCubit>(() => PostCubit(getIt()));
  getIt.registerLazySingleton<PostRepo>(() => PostRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
    ),
  );
  return dio;
}
