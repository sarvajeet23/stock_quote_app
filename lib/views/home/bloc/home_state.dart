import 'package:equatable/equatable.dart';
import '../../../models/stock_model.dart';


abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<StockModel> stocks;
  final List<String> watchlist;

  HomeLoaded({required this.stocks, required this.watchlist});

  @override
  List<Object?> get props => [stocks, watchlist];
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);

  @override
  List<Object?> get props => [error];
}
