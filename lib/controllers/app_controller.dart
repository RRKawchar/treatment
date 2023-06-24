
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_services/api_service.dart';
import '../api_services/department_service.dart';
import '../api_services/doctor_service.dart';
import '../api_services/review_service.dart';
import '../model/department_model.dart';
import '../model/doctor_model.dart';
import '../model/symptom_model.dart';
import '../model/user_model.dart';
import '../view/login/login_screen.dart';

class AppController extends GetxController {
  RxString _token = ''.obs;
  RxString _usertype = ''.obs;
  String? get token => _token.value;
  String? get usertype => _usertype.value;


  Rx<DoctorModel?> doctorProfile = Rx<DoctorModel?>(null);
  RxList<DepartmentData> departments = <DepartmentData>[].obs;
  RxList<DoctorData> doctors = <DoctorData>[].obs;
  Rx<UserModel?> userProfile = Rx<UserModel?>(null);
  Rx<UserModel?> agentProfile = Rx<UserModel?>(null);
  RxList<SymptomData> symptoms = <SymptomData>[].obs;
  @override
  void onInit() {
    super.onInit();
    getTokenFromSharedPreferences();
    getUserTypeFromSharedPreferences();
  }

  void setToken(String token) {
    _token.value = token;
    storeTokenInSharedPreferences(token);
  }

  void setUsertype(String userType) {
    _usertype.value = userType;
    storeUserTypeInSharedPreferences(userType);
  }
  void logout() {
    _token.value = '';
    _usertype.value = '';
    Get.offAll(() => const LoginScreen());
  }

  void getTokenFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? storedToken = preferences.getString('token');
    if (storedToken != null) {
      _token.value = storedToken;
    }
  }

  void getUserTypeFromSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? storedUserType = preferences.getString('usertype');
    if (storedUserType != null) {
      _usertype.value = storedUserType;
    }
  }

  void storeTokenInSharedPreferences(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  void storeUserTypeInSharedPreferences(String userType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('usertype', userType);
  }


  Future<void> fetchDoctorProfile(String token, context) async {
    try {
      final response = await DoctorService.fetchDoctorProfile(token, context);
      doctorProfile.value = response;
    } catch (e) {
print(e.toString());
    }
  }
  Future<void> fetchDepartments(String token, context) async {
    try {
      final response = await DepartmentService.fetchDepartmentData(token);
      departments.value = response;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAllSymptoms(String token,context) async {
    try {
      symptoms.value = await ApiService().fetchSymptoms(token,context);
      print(symptoms);
      
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchAllDoctors(String token, context) async {
    try {

      final response = await DoctorService.fetchAllDoctors(token, context);
      doctors.value = response;
      update();
      print(doctors);

    } catch (e) {
      print(e.toString());
    }

  }

  Future<void> fetchUserProfile(String token) async {
    try {
      userProfile.value = await ApiService.fetchUserProfile(token);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchAgentProfile(String token) async {
    try {
      userProfile.value = await ApiService.fetchUserProfile(token);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateDoctorInformation(
      context, {
        required String token,
        required String consultationFee,
        required String followUpFee,
      }) async {
    try {
      await DoctorService.updateDoctorInformation(
        context,
        token: token,
        consultationFee: consultationFee,
        followUpFee: followUpFee,
      );
    } catch (e) {
      print(e.toString());
    }
  }
  void addReview(String doctorId,stars,reviewText,token)async{
    await ReviewsApiService.addReview(doctorId, stars, reviewText, token);
  }
  void updateReview(String doctorId,stars,reviewText,token)async{
    await ReviewsApiService.editReview(doctorId, stars, reviewText, token);
  }
}
