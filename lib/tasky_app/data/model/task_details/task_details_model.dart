import 'package:todo/core/util/app_import.dart';

class TaskDetailsModel extends TaskDetails {
  const TaskDetailsModel(
      {required super.id,
      required super.image,
      required super.title,
      required super.description,
      required super.priority,
      required super.duiDate,
      required super.state});

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json) {
    return TaskDetailsModel(
      id: json['_id'],
      image: json['image'],
      title: json['title'],
      description: json['desc'],
      priority: json['priority'],
      duiDate: json['createdAt'],
      state: json['status'],
    );
  }
}
