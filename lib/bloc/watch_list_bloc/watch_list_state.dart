class WatchListState {}

class WatchListInitial extends WatchListState {}

class LoadingState extends WatchListState {}

class LoadedState extends WatchListState {
  final data;
  LoadedState({this.data});
}

class LoadCompanyState extends WatchListState {
  final data;
  LoadCompanyState({this.data});
}


class ErrorState extends WatchListState {}