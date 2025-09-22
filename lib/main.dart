import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fruvi/features/chat/screens/chat_screen.dart'; // ✅ Debe apuntar a la ruta correcta

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  await Hive.initFlutter();
  runApp(const FruviApp());
}

class FruviApp extends StatelessWidget {
  const FruviApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Fruvi',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const ChatScreen(), // ✅ Constructor const definido en chat_screen.dart
      ),
    );
  }
}