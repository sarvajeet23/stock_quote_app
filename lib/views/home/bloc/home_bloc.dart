import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../client/api_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;
  final List<String> _watchlist = [];

  HomeBloc(this.apiService) : super(HomeInitial()) {
    on<FetchStocks>(_fetchStocks);
    on<AddToWatchlist>(_addToWatchlist);
    on<SearchStocks>(_searchStocks);
    on<RemoveFromWatchlist>(_removeFromWatchlist);
  }

  Future<void> _fetchStocks(FetchStocks event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final stocks = await apiService.getStocks();
      emit(HomeLoaded(stocks: stocks, watchlist: _watchlist));
    } catch (e) {
      emit(HomeError('Failed to fetch stocks: $e'));
    }
  }

  void _addToWatchlist(AddToWatchlist event, Emitter<HomeState> emit) {
    if (!_watchlist.contains(event.symbol)) {
      _watchlist.add(event.symbol);
    }

    if (state is HomeLoaded) {
      emit(HomeLoaded(
        stocks: (state as HomeLoaded).stocks,
        watchlist: _watchlist,
      ));
    }
  }

  void _removeFromWatchlist(
      RemoveFromWatchlist event, Emitter<HomeState> emit) {
    _watchlist.remove(event.symbol);

    if (state is HomeLoaded) {
      emit(HomeLoaded(
        stocks: (state as HomeLoaded).stocks,
        watchlist: _watchlist,
      ));
    }
  }

  void _searchStocks(SearchStocks event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final allStocks = (state as HomeLoaded).stocks;
      final query = event.query.toLowerCase();
      final filteredStocks = allStocks
          .where((stock) =>
              (stock.symbol?.toLowerCase().contains(query) ?? false) ||
              (stock.companyName?.toLowerCase().contains(query) ?? false))
          .toList();
      emit(HomeLoaded(stocks: filteredStocks, watchlist: _watchlist));
    }
  }
}
