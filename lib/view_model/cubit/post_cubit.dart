import 'package:bloc/bloc.dart';
import '../../data/repo/post_repo.dart';
import 'package:meta/meta.dart';

import '../../data/model/post.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepo postRepo;

  PostCubit(this.postRepo) : super(PostInitial());

  void emitGetAllUsers(List<Post> allPostsList) {
    postRepo.getAllPosts().then((postsList) {
      emit(GetAllPosts(postsList));
    });
  }
}
