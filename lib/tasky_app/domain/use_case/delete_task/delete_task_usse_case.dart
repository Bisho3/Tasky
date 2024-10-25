import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class DeleteTaskUseCase extends BaseUseCase<DeleteTask, DeleteTaskParameter> {
  final BaseTaskyRepository _baseTaskyRepository;

  DeleteTaskUseCase(this._baseTaskyRepository);

  @override
  Future<Either<Failure, DeleteTask>> call(
      DeleteTaskParameter parameter) async {
    return await _baseTaskyRepository.deleteTask(parameter);
  }
}

class DeleteTaskParameter extends Equatable {
  final String id;

  const DeleteTaskParameter({
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
