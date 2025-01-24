import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/bloc/home_bloc.dart';
import '../home/bloc/home_event.dart';
import '../home/bloc/home_state.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final watchlistStocks = state.stocks.where((stock) {
              return state.watchlist.contains(stock.symbol);
            }).toList();

            if (watchlistStocks.isEmpty) {
              return const Center(child: Text('No stocks in the watchlist.'));
            }

            return ListView.builder(
              itemCount: watchlistStocks.length,
              itemBuilder: (context, index) {
                final stock = watchlistStocks[index];

                return ListTile(
                  onTap: () {
                    if (stock.symbol != null) {
                      context
                          .read<HomeBloc>()
                          .add(RemoveFromWatchlist(stock.symbol!));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${stock.symbol} removed from Watchlist'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  title: Text(stock.companyName ?? 'Unknown'),
                  subtitle: Text(stock.symbol ?? 'Unknown'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
