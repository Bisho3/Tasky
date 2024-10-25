import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class GetTaskUseCase extends BaseUseCase<Tasks, NoParameters> {
  final BaseTaskyRepository _baseTaskyRepository;

  GetTaskUseCase(this._baseTaskyRepository);

  @override
  Future<Either<Failure, Tasks>> call(NoParameters parameter) async {
    return await _baseTaskyRepository.getTasks();
  }
}
