import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/registration_model.dart';

class AuthService{
  static const baseUrl = 'https://test.wishesimg.com/api';

  Future<Map<String, dynamic>> registerUser(RegistrationModel user) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(url, body: user.toJson());
    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<String> loginGeneralUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final body = {'email': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['token']as String; // Extract the token from the response
      return token;
    } else {
      throw Exception('Failed to login user');
    }
  }


  Future<String> loginDoctorAgent(String email, String password) async {
    final url = Uri.parse('$baseUrl/doctor-agent/login');
    final body = {'email': email, 'password': password};
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['token']as String; // Extract the token from the response
      return token;
    } else {
      throw Exception('Failed to login doctor/agent');
    }
  }
}