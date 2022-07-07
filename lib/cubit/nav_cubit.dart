import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_api_demo/view/posts_view.dart';

import '../post_modal.dart';

class NavCubit extends Cubit<Post> {
  NavCubit() : super(Post());

  void showPostDetails(Post post) => emit(post);

  void popToPosts() => emit(state);
}
