import 'package:todo/core/util/app_import.dart';

class ProfileModel extends Profile {
  const ProfileModel(
      {required super.name,
      required super.phone,
      required super.level,
      required super.yearExperience,
      required super.address});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["displayName"],
      phone: json["username"],
      level: json["level"],
      yearExperience: json["experienceYears"],
      address: json["address"],
    );
  }
}
