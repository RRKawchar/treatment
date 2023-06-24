import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/doctor_model.dart';
import '../model/symptom_model.dart';
import '../model/user_model.dart';



class ApiService {
  static const baseUrl = 'https://test.wishesimg.com/api';

static  Future<UserModel> fetchUserProfile(String token) async {
  final url = Uri.parse('$baseUrl/user');
  final headers = {'Authorization': 'Bearer $token'};
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return UserModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to fetch user data');
  }
}
  static  Future<UserModel>  getAgentProfile(String token) async {

      final url = Uri.parse('$baseUrl/agent/profile');

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return UserModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to fetch user data');
      }

  }

  Future<List<SymptomData>> fetchSymptoms(String token, context) async {
    final url = Uri.parse('$baseUrl/symptoms');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body); // Parse the response body into JSON
      List<SymptomData> symptoms = [];
      for (var data in jsonResponse['data']) {
        SymptomData symptomData = SymptomData.fromJson(data);
        symptoms.add(symptomData);
      }

      return symptoms;
    } else {
      throw Exception('Failed to fetch department data');
    }
  }




  static Future<void> addExperience(String token, String designation,
      String departmentId, String employmentStatus, String period) async {
    final url = Uri.parse('$baseUrl/doctor-agent/add-experience');
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'designation': designation,
      'department_id': departmentId,
      'employment_status': employmentStatus,
      'period': period,
    };

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to add experience');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<void> updateExperience(String token, String designation,
      String departmentId, String employmentStatus, String period) async {
    final url = Uri.parse('$baseUrl/doctor-agent/experience-update/3');
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'designation': designation,
      'department_id': departmentId,
      'employment_status': employmentStatus,
      'period': period,
    };

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {

      } else {
        throw Exception('Failed to update experience');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  static Future<DoctorInfo> updateDoctorInfo(
      String token, DoctorInfo doctorInfo) async {
    final url = Uri.parse('$baseUrl/information');

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(doctorInfo.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return DoctorInfo.fromJson(jsonData);
    } else {
      throw Exception('Failed to update doctor info');
    }
  }

  static Future<DoctorInfo> addDoctorInfo(
      String token, DoctorInfo doctorInfo) async {
    final url = Uri.parse('$baseUrl/information');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(doctorInfo.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return DoctorInfo.fromJson(jsonData);
    } else {
      throw Exception('Failed to add doctor info');
    }
  }
}
