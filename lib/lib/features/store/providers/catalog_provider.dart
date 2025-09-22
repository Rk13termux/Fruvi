import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruvi/models/product.dart';
import 'package:fruvi/services/supabase_service.dart';

class CatalogNotifier extends StateNotifier<List<Product>> {
  final Reader _read;

  CatalogNotifier(this._read) : super([]) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final supabaseService = _read(supabaseServiceProvider);
      final products = await supabaseService.getProducts();
      state = products;
    } catch (e) {
      print('Error loading products: $e');
    }
  }
}