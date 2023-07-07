import 'package:bloc/bloc.dart';

import '../../data/repositories/repo.dart';
import 'market_event.dart';
import 'market_state.dart';


class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final Repo repo;
  MarketBloc(this.repo) : super(MarketInitial()) {
    on<GetMarketEvent>(onValueChange);
  }

  onValueChange(GetMarketEvent getMarketIndexEvent, Emitter<MarketState> emit) async {
    emit(MarketLoadingState());

    try {
      final stockData = await repo.getApiData1();

      emit(MarketLoadedState(data: stockData));

    } catch (e){
      emit(MarketErrorState());
    }

  }
}
