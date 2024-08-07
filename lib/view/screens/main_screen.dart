import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post.dart';
import '../../view_model/cubit/post_cubit.dart';
import '../widgets/post_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).emitGetAllUsers(posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BRG Task'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is GetAllPosts) {
            posts = state.posts;
            return ListView.separated(
              itemBuilder: (context, index) => PostItem(post: posts[index]),
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: posts.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
