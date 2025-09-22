import 'package:riverpod/riverpod.dart';
import 'package:fruvi/services/groq_service.dart';
import 'package:fruvi/services/supabase_service.dart';
import 'package:fruvi/features/store/providers/cart_provider.dart';
import 'package:fruvi/features/store/providers/catalog_provider.dart';

final groqServiceProvider = Provider((ref) => GroqService());
final supabaseServiceProvider = Provider((ref) => SupabaseService());
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) => CartNotifier());
final catalogProvider = StateNotifierProvider<CatalogNotifier, List<Product>>((ref) => CatalogNotifier(ref.read));