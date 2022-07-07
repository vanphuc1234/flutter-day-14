import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_api_demo/cubit/nav_cubit.dart';
import 'package:flutter_bloc_cubit_api_demo/post_modal.dart';
import 'package:flutter_bloc_cubit_api_demo/view/posts_details_view.dart';
import 'package:flutter_bloc_cubit_api_demo/view/posts_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(
      builder: ((context, state) {
        return Navigator(
          pages: [
            MaterialPage(child: PostsView()),
            if (state != null)
              MaterialPage(child: PostsDetailsView(post: state)),
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      }),
    );
  }
}
