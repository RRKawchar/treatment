import 'dart:convert';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  bool success;
  String message;
  List<dynamic>? avgRatingStars;
  DoctorData data;

  DoctorModel({
    required this.success,
    required this.message,
    required this.avgRatingStars,
    required this.data,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    success: json["success"],
    message: json["message"],
    avgRatingStars: List<dynamic>.from(json["avg_rating_stars"].map((x) => x)),
    data: DoctorData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "avg_rating_stars": avgRatingStars != null ? List<dynamic>.from(avgRatingStars!.map((x) => x)) : null,
    "data": data.toJson(),
  };
}

class DoctorData {
  int id;
  String name;
  String doctorCode;
  String email;
  String phone;
  String username;
  String usertype;
  dynamic profilePicture;
  dynamic about;
  String gender;
  bool? status;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> position;
  List<dynamic> departments;
  List<dynamic> symptoms;
  List<DoctorInfo> info;
  List<DoctorExperience> experience;
  List<dynamic> reviews;

  DoctorData({
    required this.id,
    required this.name,
    required this.doctorCode,
    required this.email,
    required this.phone,
    required this.username,
    required this.usertype,
    this.profilePicture,
    this.about,
    required this.gender,
    required this.status,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.position,
    required this.departments,
    required this.symptoms,
    required this.info,
    required this.experience,
    required this.reviews,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
    id: json["id"],
    name: json["name"],
    doctorCode: json["doctor_code"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    usertype: json["usertype"],
    profilePicture: json["profile_picture"],
    about: json["about"],
    gender: json["gender"],
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    position: List<dynamic>.from(json["position"].map((x) => x)),
    departments: List<dynamic>.from(json["departments"].map((x) => x)),
    symptoms: List<dynamic>.from(json["symptoms"].map((x) => x)),
    info: List<DoctorInfo>.from(json["info"].map((x) => DoctorInfo.fromJson(x))),
    experience: List<DoctorExperience>.from(json["experience"].map((x) => DoctorExperience.fromJson(x))),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "doctor_code": doctorCode,
    "email": email,
    "phone": phone,
    "username": username,
    "usertype": usertype,
    "profile_picture": profilePicture,
    "about": about,
    "gender": gender,
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "position": List<dynamic>.from(position.map((x) => x)),
    "departments": List<dynamic>.from(departments.map((x) => x)),
    "symptoms": List<dynamic>.from(symptoms.map((x) => x)),
    "info": List<dynamic>.from(info.map((x) => x.toJson())),
    "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
  };
}

class DoctorExperience {
  int id;
  String doctorId;
  String departmentId;
  String designation;
  String employmentStatus;
  String period;
  DateTime createdAt;
  DateTime updatedAt;

  DoctorExperience({
    required this.id,
    required this.doctorId,
    required this.departmentId,
    required this.designation,
    required this.employmentStatus,
    required this.period,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorExperience.fromJson(Map<String, dynamic> json) => DoctorExperience(
    id: json["id"],
    doctorId: json["doctor_id"],
    departmentId: json["department_id"],
    designation: json["designation"],
    employmentStatus: json["employment_status"],
    period: json["period"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "department_id": departmentId,
    "designation": designation,
    "employment_status": employmentStatus,
    "period": period,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DoctorInfo {
  int id;
  String doctorAgentId;
  String consultationFee;
  String followUpFee;
  DateTime createdAt;
  DateTime updatedAt;

  DoctorInfo({
    required this.id,
    required this.doctorAgentId,
    required this.consultationFee,
    required this.followUpFee,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) => DoctorInfo(
    id: json["id"],
    doctorAgentId: json["doctor_agent_id"],
    consultationFee: json["consultation_fee"],
    followUpFee: json["follow_up_fee"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_agent_id": doctorAgentId,
    "consultation_fee": consultationFee,
    "follow_up_fee": followUpFee,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
