import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_api_demo/cubit/nav_cubit.dart';
import 'package:flutter_bloc_cubit_api_demo/view/app_navigator.dart';
import './cubit/posts_cubit.dart';
import './view/posts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(providers: [
      BlocProvider(create: (context) => NavCubit()),
      BlocProvider(
        create: (context) => PostsBloc()..add(LoadPostsEvent()),
      )
    ], child: const AppNavigator()));
  }
}
