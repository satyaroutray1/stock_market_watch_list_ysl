class MarketState {}

class MarketInitial extends MarketState {}

class MarketLoadingState extends MarketState {}

class MarketLoadedState extends MarketState {
  final data;
  MarketLoadedState({this.data});
}

class MarketErrorState extends MarketState {}