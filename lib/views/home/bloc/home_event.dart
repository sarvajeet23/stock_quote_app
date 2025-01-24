import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStocks extends HomeEvent {}

class AddToWatchlist extends HomeEvent {
  final String symbol;

  AddToWatchlist(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

class RemoveFromWatchlist extends HomeEvent {
  final String symbol;
  RemoveFromWatchlist(this.symbol);
  @override
  List<Object?> get props => [symbol];
}

class SearchStocks extends HomeEvent {
  final String query;

  SearchStocks(this.query);

  @override
  List<Object?> get props => [query];
}
