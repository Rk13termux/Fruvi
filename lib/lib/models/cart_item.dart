import 'package:fruvi/models/product.dart';

class CartItem {
  final Product product;
  final double quantity;
  final String measurementType;

  CartItem({
    required this.product,
    required this.quantity,
    required this.measurementType,
  });

  double get totalPrice => quantity * getPriceByType();

  double getPriceByType() {
    switch (measurementType) {
      case 'kg':
        return product.pricePerKg;
      case 'g':
        return product.pricePerKg / 1000;
      case 'unit':
        return product.pricePerUnit;
      case 'bulk':
        return product.pricePerBulk;
      default:
        return product.pricePerKg;
    }
  }
}