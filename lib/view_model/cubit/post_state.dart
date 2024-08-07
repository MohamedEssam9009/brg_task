part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class GetAllPosts extends PostState {
  final List<Post> posts;
  GetAllPosts(this.posts);
}
