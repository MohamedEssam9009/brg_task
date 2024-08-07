import 'package:flutter/material.dart';

import '../../data/model/post.dart';
import '../screens/details_screen.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: ListTile(
        title: Text(post.title ?? 'title'),
        subtitle: Text(post.body ?? 'body'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(post: post)));
        },
      ),
    );
  }
}
