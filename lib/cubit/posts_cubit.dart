import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_service.dart';
import '../post_modal.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post>? posts;
  LoadedPostsState({this.posts});
}

class FailedToLoadPostsState extends PostsState {
  Error? error;
  FailedToLoadPostsState({this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>(_onLoadPostsEvent);
    on<PullToRefreshEvent>(_onLoadPostsEvent);
  }
  void _onLoadPostsEvent(event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());
    try {
      final p = await _dataService.getPosts();
      emit(LoadedPostsState(posts: p));
    } catch (e) {
      emit(FailedToLoadPostsState(error: e as Error));
    }
  }
}
  // void _onPullToRefreashEvent(
  //     PullToRefreshEvent event, Emitter<PostsState> emit) async {
  //   emit(LoadingPostsState());
  //   try {
  //     final p = await _dataService.getPosts();
  //     emit(LoadedPostsState(posts: p));
  //   } catch (e) {
  //     emit(FailedToLoadPostsState());
  //   }
  // }



//git config --global --add safe.directory *