import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/department_model.dart';

class DepartmentService {
  static const baseUrl = 'https://test.wishesimg.com/api';


 static Future<List<DepartmentData>> fetchDepartmentData(String token) async {
    final url = Uri.parse('$baseUrl/departments');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body); // Parse the response body into JSON
      List<DepartmentData> departments = [];
      for (var data in jsonResponse['data']) {
        DepartmentData departmentData = DepartmentData.fromJson(data);
        departments.add(departmentData);
      }

      return departments;
    } else {
      throw Exception('Failed to fetch department data');
    }
  }



  // Future<void> setDepartment(String token, int departmentId) async {
  //   final url = Uri.parse('$baseUrl/doctor-agent/set-department');
  //
  //   final headers = {
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'Authorization': 'Bearer $token',
  //   };
  //
  //   final body = {
  //     'departments_id': departmentId.toString(),
  //   };
  //
  //   final response = await http.post(url, headers: headers, body: body);
  //
  //   if (response.statusCode == 200) {
  //
  //   } else {
  //
  //   }
  // }
}











