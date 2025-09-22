import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroqService {
  final Dio _dio = Dio();
  final String _apiKey = dotenv.env['GROQ_API_KEY']!;
  final String _baseUrl = 'https://api.groq.com/openai/v1';

  Future<String> sendMessage(String prompt) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/chat/completions',
        data: {
          'model': 'llama3-70b-8192',
          'messages': [
            {
              'role': 'system',
              'content':
                  'Eres Fruvi, un asistente experto en frutas y verduras importadas. Solo responde sobre este tema. Si te preguntan algo fuera de contexto, responde: "Lo siento, solo puedo ayudarte con información sobre frutas y verduras importadas."',
            },
            {'role': 'user', 'content': prompt}
          ],
          'temperature': 0.7,
        },
        options: Options(headers: {'Authorization': 'Bearer $_apiKey'}),
      );

      return response.data['choices'][0]['message']['content'] as String;
    } catch (e) {
      return 'Lo siento, hubo un error al procesar tu solicitud. ¿Puedes intentarlo de nuevo?';
    }
  }
}