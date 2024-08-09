import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/extensions.dart';
import '../../data/model/post.dart';
import '../../view_model/cubit/post_cubit.dart';
import '../widgets/post_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Post> allPosts = [];
  List<Post> searchedForAllPosts = [];
  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Search for post...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      onChanged: (searchedPost) {
        addSearchedPostToSearchedList(searchedPost);
      },
    );
  }

  // Search posts method
  void addSearchedPostToSearchedList(String searchedPost) {
    searchedForAllPosts = allPosts
        .where((post) =>
            post.title!.toLowerCase().startsWith(searchedPost.toLowerCase()))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            clearSearch();
            context.pop();
          },
        )
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: startSearch,
        )
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: stopSearching,
    ));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return const Text(
      'Main Screen',
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).emitGetAllUsers(allPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),
        leading:
            isSearching ? const BackButton(color: Colors.white) : Container(),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is GetAllPosts) {
            allPosts = state.posts;
            return ListView.separated(
              itemBuilder: (context, index) => PostItem(
                post: searchTextController.text.isEmpty
                    ? allPosts[index]
                    : searchedForAllPosts[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              itemCount: searchTextController.text.isEmpty
                  ? allPosts.length
                  : searchedForAllPosts.length,
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
