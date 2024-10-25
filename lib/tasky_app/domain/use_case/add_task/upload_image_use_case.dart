import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class UploadImageUseCase
    extends BaseUseCase<UploadImage, UploadImageParameter> {
  final BaseTaskyRepository _baseTaskyRepository;

  UploadImageUseCase(this._baseTaskyRepository);

  @override
  Future<Either<Failure, UploadImage>> call(
      UploadImageParameter parameter) async {
    return await _baseTaskyRepository.uploadImage(parameter);
  }
}

class UploadImageParameter extends Equatable {
  final File image;

  const UploadImageParameter({
    required this.image,
  });

  @override
  List<Object> get props => [
        image,
      ];
}
