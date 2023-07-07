class WatchListEvent {}

class GetWatchlistEvent extends WatchListEvent {
  final companyName;
  GetWatchlistEvent({this.companyName});
}

