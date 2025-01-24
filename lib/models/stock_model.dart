class StockModel {
  String? symbol;
  String? companyName;
  double? currentPrice;
  double? changeAmount;
  double? changePercentage;
  String? marketCap;
  double? peRatio;

  StockModel({
    this.symbol,
    this.companyName,
    this.currentPrice,
    this.changeAmount,
    this.changePercentage,
    this.marketCap,
    this.peRatio,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        symbol: json["symbol"],
        companyName: json["company_name"],
        currentPrice: json["current_price"]?.toDouble(),
        changeAmount: json["change_amount"]?.toDouble(),
        changePercentage: json["change_percentage"]?.toDouble(),
        marketCap: json["market_cap"],
        peRatio: json["pe_ratio"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "company_name": companyName,
        "current_price": currentPrice,
        "change_amount": changeAmount,
        "change_percentage": changePercentage,
        "market_cap": marketCap,
        "pe_ratio": peRatio,
      };
}
