import 'package:todo/core/util/app_import.dart';

class Profile extends Equatable {
  final String name;
  final String phone;
  final String level;
  final int yearExperience;
  final String address;

  const Profile(
      {required this.name,
      required this.phone,
      required this.level,
      required this.yearExperience,
      required this.address});

  @override
  List<Object> get props => [name, phone, level, yearExperience, address];
}
