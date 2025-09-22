class Product {
  final String id;
  final String name;
  final String category;
  final String origin;
  final double pricePerKg;
  final double pricePerUnit;
  final double pricePerBulk;
  final String imageUrl;
  final String description;
  final bool isAvailable;
  final String measurementType; // 'kg', 'g', 'unit', 'bulk'

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.origin,
    required this.pricePerKg,
    required this.pricePerUnit,
    required this.pricePerBulk,
    required this.imageUrl,
    required this.description,
    required this.isAvailable,
    required this.measurementType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        origin: json['origin'],
        pricePerKg: (json['price_per_kg'] as num?)?.toDouble() ?? 0.0,
        pricePerUnit: (json['price_per_unit'] as num?)?.toDouble() ?? 0.0,
        pricePerBulk: (json['price_per_bulk'] as num?)?.toDouble() ?? 0.0,
        imageUrl: json['image_url'],
        description: json['description'],
        isAvailable: json['is_available'],
        measurementType: json['measurement_type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'origin': origin,
        'price_per_kg': pricePerKg,
        'price_per_unit': pricePerUnit,
        'price_per_bulk': pricePerBulk,
        'image_url': imageUrl,
        'description': description,
        'is_available': isAvailable,
        'measurement_type': measurementType,
      };
}