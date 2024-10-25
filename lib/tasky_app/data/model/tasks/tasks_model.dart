import 'package:todo/core/util/app_import.dart';

class TasksModel extends Tasks {
  const TasksModel({required super.items});

  factory TasksModel.fromJson(List<dynamic> jsonList) {
    return TasksModel(
      items: List<ItemTask>.from(
          jsonList.map((x) => ItemTaskModel.fromJson(x))),
    );
  }
}

class ItemTaskModel extends ItemTask {
  const ItemTaskModel(
      {required super.id,
      required super.image,
      required super.title,
      required super.description,
      required super.priority,
      required super.duiDate,
      required super.state});

  factory ItemTaskModel.fromJson(Map<String, dynamic> json) {
    return ItemTaskModel(
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
