import 'package:brg_task/data/model/post.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'web_services.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('posts')
  Future<List<Post>> getAllPosts();

  // @GET('users/{id}')
  // Future<User> getUserById(@Path('id') int userId);
}