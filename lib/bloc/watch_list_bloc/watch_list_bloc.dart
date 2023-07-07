import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/repo.dart';
import 'watch_list_event.dart';
import 'watch_list_state.dart';


class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final Repo repo;

  WatchListBloc(this.repo) : super(WatchListInitial()) {
    on<GetWatchlistEvent>(onValueChange);

  }

  onValueChange(GetWatchlistEvent getWatchListEvent, Emitter<WatchListState> emit) async {
    emit(LoadingState());

    try {
      final stockData = await repo.getApiData();

      if(getWatchListEvent.companyName == null ){
        emit(LoadedState(data: stockData));

      }else{
        emit(LoadCompanyState(data: stockData));
      }

    } catch (e){
      emit(ErrorState());
    }

  }
}
