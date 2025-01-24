import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import '../models/stock_model.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000';
//  final String baseUrl = 'http://192.168.1.3:8000';

  Future<List<StockModel>> getStocks() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/stocks'));
      if (response.statusCode == 200) {
        log("Response: ${response.body}");

        final Map<String, dynamic> data = json.decode(response.body);
        return data.values.map<StockModel>((stockJson) {
          try {
            log('message: Stock JSON: $stockJson');
            return StockModel.fromJson(stockJson);
          } catch (e, st) {
            log('Error: $e + $st');
            return StockModel();
          }
        }).toList();
      } else {
        throw Exception(
            'Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e, st) {
      log('Error: $e + $st');
      return [];
    }
  }

  // Future<void> addStock(StockModel stock) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/stocks'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(stock.toJson()),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception(
  //         'Error: ${response.statusCode} - ${response.reasonPhrase}');
  //   }
  // }

  // Future<void> updateStock(String symbol, StockModel stock) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/stocks/$symbol'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(stock.toJson()),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to update stock');
  //   }
  // }

  // Future<void> deleteStock(String symbol) async {
  //   final response = await http.delete(Uri.parse('$baseUrl/stocks/$symbol'));

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to delete stock');
  //   }
  // }
}
