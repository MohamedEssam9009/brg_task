import 'package:brg_task/data/model/post.dart';
import 'package:brg_task/data/web_services/web_services.dart';

class PostRepo {
  final WebServices webServices;

  PostRepo( this.webServices);

  Future<List<Post>> getAllPosts() async {
    final response = await webServices.getAllPosts();
    return response.map((post) => Post.fromJson(post.toJson())).toList();
  }
}
