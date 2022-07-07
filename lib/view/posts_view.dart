import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_api_demo/cubit/posts_cubit.dart';
import 'package:flutter_bloc_cubit_api_demo/post_modal.dart';

import 'package:flutter_bloc_cubit_api_demo/post_modal.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostsBloc>(context).add(PullToRefreshEvent()),
              child: ListView.builder(
                  itemCount: state.posts?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(title: Text('state.posts?[index].title')),
                    );
                  }),
            );
          } else if (state is FailedToLoadPostsState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
