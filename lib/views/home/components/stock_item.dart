import 'package:flutter/material.dart';
import 'package:stock_quote_app/models/stock_model.dart';

class StockItem extends StatelessWidget {
  final StockModel stock;
  final Function onLongPress;

  const StockItem({super.key, required this.stock, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onLongPress(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: Text(stock.companyName ?? "Unknown"),
              subtitle: Text(stock.symbol ?? "Unknown"),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(stock.marketCap ?? "Unknown"),
                Text(
                  "${stock.peRatio?.toString() ?? "Unknown"}%",
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                stock.changePercentage?.toString() ?? "Unknown",
                style: TextStyle(
                  color: (stock.changePercentage != null &&
                          stock.changePercentage! > 0)
                      ? Colors.green
                      : (stock.changePercentage != null &&
                              stock.changePercentage! < 0)
                          ? Colors.red
                          : Colors.black,
                ),
              ),
              subtitle: Text(
                stock.changeAmount?.toString() ?? "Unknown",
                style: TextStyle(
                  color: (stock.changeAmount != null && stock.changeAmount! > 0)
                      ? Colors.green
                      : (stock.changeAmount != null && stock.changeAmount! < 0)
                          ? Colors.red
                          : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
