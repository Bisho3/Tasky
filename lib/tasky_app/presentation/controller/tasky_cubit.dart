import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

part 'tasky_state.dart';

@injectable
class TaskyCubit extends Cubit<TaskyState> {
  final ImagePicker _picker = ImagePicker();

  TaskyCubit() : super(const TaskyState());

  Future<void> pickImage({
    required bool isCamera,
  }) async {
    File? uploadImage = state.uploadImage;

    final XFile? image = await _picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      uploadImage = File(image.path);
      emit(state.copyWith(uploadImage: uploadImage, failureImage: false));
    } else {
      emit(state.copyWith(failureImage: true));
    }
  }

  void removeImage() {
    emit(state.copyWith(
      removeImageState: BottomState.loading,
    ));
    File? uploadImage = state.uploadImage;
    uploadImage = File("");

    emit(state.copyWith(
      uploadImage: uploadImage,
      removeImageState: BottomState.success,
    ));
  }
}
