import 'package:flutter/material.dart';
import '../post_modal.dart';

class PostsDetailsView extends StatelessWidget {
  final Post? post;

  PostsDetailsView({Key? key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${post?.title}')),
      body: Center(child: Text('${post?.body}')),
    );
  }
}
