import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruvi/models/product.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Product>> getProducts() async {
    final data = await _client
        .from('products')
        .select()
        .eq('is_available', true);

    return data.map((e) => Product.fromJson(e)).toList();
  }
}