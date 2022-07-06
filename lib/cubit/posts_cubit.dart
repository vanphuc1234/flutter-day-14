import 'package:flutter_bloc_cubit_api_demo/data_service.dart';
import 'package:flutter_bloc_cubit_api_demo/post_modal.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../post_modal.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
