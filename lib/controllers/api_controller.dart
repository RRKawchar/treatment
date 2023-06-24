import 'package:get/get.dart';
import '../api_services/api_service.dart';
import '../model/doctor_model.dart';


class ApiController extends GetxController {
  DoctorExperience? doctorExperiences;
  DoctorInfo? doctorInfo;

  Future<void> addExperience(String token, String designation,
      String departmentId, String employmentStatus, String period) async {
    try {
      await ApiService.addExperience(
          token, designation, departmentId, employmentStatus, period);

      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateExperience(String token, String designation,
      String departmentId, String employmentStatus, String period) async {
    try {
      await ApiService.updateExperience(
          token, designation, departmentId, employmentStatus, period);

      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateDoctorInfo(String token, DoctorInfo doctorInfo) async {
    try {
      doctorInfo = await ApiService.updateDoctorInfo(token, doctorInfo);
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addDoctorInfo(String token, DoctorInfo doctorInfo) async {
    try {
      doctorInfo = await ApiService.addDoctorInfo(token, doctorInfo);
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
