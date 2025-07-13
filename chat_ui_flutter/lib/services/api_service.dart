import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_config.dart';

class ApiService {

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse(ApiConfig.chatEndpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['reply'];
    } else {
      throw Exception('Failed to get response');
    }
  }
}
