import '../model/post.dart';
import '../web_services/web_services.dart';

class PostRepo {
  final WebServices webServices;

  PostRepo( this.webServices);

  Future<List<Post>> getAllPosts() async {
    final response = await webServices.getAllPosts();
    return response.map((post) => Post.fromJson(post.toJson())).toList();
  }
}
