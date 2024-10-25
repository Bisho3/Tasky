import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class GetTaskDetailsUseCase
    extends BaseUseCase<TaskDetails, GetTaskDetailsParameter> {
  final BaseTaskyRepository _baseTaskyRepository;

  GetTaskDetailsUseCase(this._baseTaskyRepository);

  @override
  Future<Either<Failure, TaskDetails>> call(
      GetTaskDetailsParameter parameter) async {
    return await _baseTaskyRepository.getTasksDetails(parameter);
  }
}

class GetTaskDetailsParameter extends Equatable {
  final String id;

  const GetTaskDetailsParameter({
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
