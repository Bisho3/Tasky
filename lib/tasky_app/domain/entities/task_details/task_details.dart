import 'package:todo/core/util/app_import.dart';

class TaskDetails extends Equatable {
  final String id;
  final String image;
  final String title;
  final String description;
  final String priority;
  final String duiDate;
  final String state;

  const TaskDetails(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.priority,
      required this.duiDate,
      required this.state});

  @override
  List<Object> get props => [
        id,
        image,
        title,
        description,
        priority,
        duiDate,
        state,
      ];
}
