import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_quote_app/views/home/components/search_bar.dart'
    as custom;
import 'package:stock_quote_app/views/home/components/stock_item.dart';
import 'package:stock_quote_app/widgets/as_linear_gradient.dart';

import '../watchlist/watchlist_page.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: const AsLinearGradient(),
        title: const Text('Stocks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<HomeBloc>().add(FetchStocks());
            },
          ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return BlocProvider.value(
                  value: context.read<HomeBloc>(),
                  child: const WatchlistPage(),
                );
              }));
            },
          ),
        ],
      ),
      body: AsLinearGradient(
        color: Colors.blue[50],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  custom.SearchBar(
                    onChanged: (query) {
                      context.read<HomeBloc>().add(SearchStocks(query));
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.stocks.length,
                      itemBuilder: (context, index) {
                        final stock = state.stocks[index];
                        return StockItem(
                          stock: stock,
                          onLongPress: () {
                            final stockSymbol = stock.symbol ?? '';
                            context
                                .read<HomeBloc>()
                                .add(AddToWatchlist(stockSymbol));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('$stockSymbol added to Watchlist'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text('No Data'));
          },
        ),
      ),
    );
  }
}
