import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/doctor_model.dart';

class DoctorService {
  static const baseUrl = 'https://test.wishesimg.com/api';

  static Future<DoctorModel> fetchDoctorProfile(String token, context) async {
    final url = Uri.parse('$baseUrl/doctor/profile');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return doctorModelFromJson(jsonString);
    } else {
      throw Exception(
          'Failed to fetch doctor profile. Error: ${response.statusCode}');
    }
  }

  static Future<List<DoctorData>> fetchAllDoctors(String token, context) async {
    final url = Uri.parse('$baseUrl/doctor/all-doctors');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      List<DoctorData> doctors = [];

      for (var doctorData in jsonData['data']) {
        DoctorData doctor = DoctorData.fromJson(doctorData);
        doctors.add(doctor);
      }

      return doctors;
    } else {
      throw Exception('Failed to fetch doctors. Error: ${response.statusCode}');
    }
  }

  static Future<void> updateDoctorInformation(
    context, {
    required String token,
    required String consultationFee,
    required String followUpFee,
  }) async {
    final url = Uri.parse('$baseUrl/doctor-agent/information-update');

    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'consultation_fee': consultationFee,
        'follow_up_fee': followUpFee,
      },
    );

    if (response.statusCode == 200) {
      print('Doctor information updated successfully');
    } else {

      print(
          'Failed to update doctor information. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to update doctor information');
    }
  }
}
