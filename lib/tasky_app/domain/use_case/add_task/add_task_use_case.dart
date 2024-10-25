import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class AddTaskUseCase extends BaseUseCase<AddTask, AddTaskParameter> {
  final BaseTaskyRepository _baseTaskyRepository;

  AddTaskUseCase(this._baseTaskyRepository);

  @override
  Future<Either<Failure, AddTask>> call(AddTaskParameter parameter) async {
    return await _baseTaskyRepository.addTask(parameter);
  }
}

class AddTaskParameter extends Equatable {
  final String image;
  final String taskTitle;
  final String taskDescription;
  final String priority;
  final String duiDate;

  const AddTaskParameter(
      {required this.image,
      required this.taskTitle,
      required this.taskDescription,
      required this.priority,
      required this.duiDate});

  @override
  List<Object> get props => [
        image,
        taskTitle,
        taskDescription,
        priority,
        duiDate,
      ];
}
