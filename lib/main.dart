import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fruvi/features/chat/screens/chat_screen.dart';

/// Punto de entrada principal de la aplicación Fruvi.
Future<void> main() async {
  // Inicializa los bindings de Flutter antes de cualquier widget.
  WidgetsFlutterBinding.ensureInitialized();

  // Carga las variables de entorno desde el archivo .env
  await dotenv.load(fileName: ".env");

  // Inicializa Supabase con las credenciales de tu proyecto
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // Inicializa Hive para almacenamiento local (offline)
  await Hive.initFlutter();

  // Ejecuta la aplicación
  runApp(const FruviApp());
}

/// Widget raíz de la aplicación.
class FruviApp extends StatelessWidget {
  const FruviApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Fruvi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        home: const ChatScreen(), // Pantalla principal: chat con IA
      ),
    );
  }
}