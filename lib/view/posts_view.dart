import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_api_demo/cubit/posts_cubit.dart';
import 'package:flutter_bloc_cubit_api_demo/post_modal.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(posts[index].title!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
