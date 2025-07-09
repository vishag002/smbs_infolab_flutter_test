class ProductModel {
  final int id;
  final double price;
  final String title;
  final String description;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  //get
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>?;

    return ProductModel(
      id: json['id'],
      price: (json['price'] as num).toDouble(),
      title: json['title'] ?? "No title",
      description: json['description'] ?? "No description",
      imageUrl: (images != null && images.isNotEmpty) ? images[0] : "",
      category: json['category'] ?? "Unknown",
    );
  }
}
