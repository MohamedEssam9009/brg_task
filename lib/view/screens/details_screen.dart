import '../../data/model/post.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: customAppBar('Details Screen'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title ?? 'title',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(post.body ?? 'body'),
        ],
      ),
    );
  }
}
