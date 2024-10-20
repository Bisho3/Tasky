part of 'tasky_cubit.dart';

class TaskyState extends Equatable {
  final File? uploadImage;
  final bool failureImage;
  final BottomState removeImageState;

  const TaskyState({
    this.uploadImage ,
    this.failureImage = false,
    this.removeImageState = BottomState.isInitial,
  });

  TaskyState copyWith({
    File? uploadImage,
    bool? failureImage,
    BottomState? removeImageState,
  }) {
    return TaskyState(
      uploadImage: uploadImage ?? this.uploadImage,
      failureImage: failureImage ?? this.failureImage,
      removeImageState: removeImageState ?? this.removeImageState,
    );
  }

  @override
  List<Object?> get props => [uploadImage, failureImage, removeImageState];
}
