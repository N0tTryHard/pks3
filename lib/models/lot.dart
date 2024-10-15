class Lot {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final String currency;
  final double initialPrice;
  final double currentPrice;
  final DateTime startDate;
  final DateTime endDate;
  final String owner;
  bool isFavorite;

  Lot({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.currency,
    required this.initialPrice,
    required this.currentPrice,
    required this.startDate,
    required this.endDate,
    required this.owner,
    this.isFavorite = false,
  });
}
