import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

part 'tasky_state.dart';

@injectable
class TaskyCubit extends Cubit<TaskyState> {
  final ImagePicker _picker = ImagePicker();
  final AddTaskUseCase _addTaskUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final GetTaskDetailsUseCase _getTaskDetailsUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskyCubit(
    this._addTaskUseCase,
    this._uploadImageUseCase,
    this._getTaskUseCase,
    this._getTaskDetailsUseCase,
    this._deleteTaskUseCase,
  ) : super(const TaskyState());

  Future<void> pickImage({
    required bool isCamera,
  }) async {
    File? uploadImage = state.uploadImage;
    final XFile? image = await _picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      uploadImage = File(image.path);
      emit(state.copyWith(
          uploadImage: uploadImage, failureImage: UploadImageStates.success));
    } else {
      emit(state.copyWith(failureImage: UploadImageStates.failure));
    }
  }

  void removeImage() {
    emit(state.copyWith(
      removeImageState: BottomState.loading,
    ));
    File? uploadImage = state.uploadImage;

    String? imagePath = state.imagePath;
    uploadImage = File("");
    imagePath = null;

    emit(state.copyWith(
      uploadImage: uploadImage,
      imagePath: imagePath,
      removeImageState: BottomState.success,
    ));
  }

  ///=============== selectedPriority ===============///
  void selectedPriority({required String priority}) {
    emit(state.copyWith(selectedPriority: priority));
  }

  ///============= add task ============///

  Future<void> addTask({
    required File image,
    required String taskTitle,
    required String taskDescription,
    required String priority,
    required String duiDate,
  }) async {
    emit(state.copyWith(addTaskState: BottomState.loading));
    final uploadImageResult =
        await _uploadImageUseCase.call(UploadImageParameter(image: image));
    uploadImageResult.fold(
      (failure) {
        emit(state.copyWith(
            addTaskFailureMessage: failure.message,
            addTaskState: BottomState.failure));
      },
      (imagePath) async {
        emit(state.copyWith(imagePath: imagePath.imagePath));

        final addTaskResult = await _addTaskUseCase.call(AddTaskParameter(
            image: imagePath.imagePath,
            taskTitle: taskTitle,
            taskDescription: taskDescription,
            priority: priority,
            duiDate: duiDate));

        addTaskResult.fold(
          (failure) {
            emit(state.copyWith(
                addTaskFailureMessage: failure.message,
                addTaskState: BottomState.failure));
          },
          (task) {
            emit(state.copyWith(addTaskState: BottomState.success));
          },
        );
      },
    );
  }

  ///=========== image Not added ============///

  Future<void> addTaskWithImage({
    required File? image,
  }) async {
    ///===========  image ========///
    File? imagePath = state.uploadImage;
    if (imagePath == null || imagePath.path.isEmpty) {
      emit(state.copyWith(
        uploadImage: imagePath,
        failureImage: UploadImageStates.failure,
      ));
    } else {
      emit(state.copyWith(
        uploadImage: imagePath,
        failureImage: UploadImageStates.success,
        addTaskState: BottomState.isInitial,
      ));
    }
  }

  ///============= selected header progress ==============///

  void selectedHeaderProgress({required int index}) {
    emit(state.copyWith(selectHeaderProgressState: ToggleStates.isStarted));

    emit(state.copyWith(
      selectHeaderProgress: index,
      selectHeaderProgressState: ToggleStates.isSelected,
    ));
  }

  ///============= get task ==============///
  Future<void> getTask() async {
    final result = await _getTaskUseCase.call(const NoParameters());
    result.fold(
      (failure) {
        emit(state.copyWith(
            getTaskFailureMessage: failure.message,
            getTaskState: RequestState.failure));
      },
      (tasks) {
        emit(state.copyWith(
          tasks: tasks,
        ));

        Tasks allTasks = state.tasks;
        List<ItemTask> waitingTasks = List.from(state.waitingTasks);
        List<ItemTask> inProgressTasks = List.from(state.inProgressTasks);
        List<ItemTask> finishedTasks = List.from(state.finishedTasks);

        waitingTasks.clear();
        inProgressTasks.clear();
        finishedTasks.clear();

        for (int i = AppIntegers.zero; i < allTasks.items.length; i++) {
          if (allTasks.items[i].state == AppConstance.waitingState) {
            waitingTasks.addAll([allTasks.items[i]]);
          }
          if (allTasks.items[i].state == AppConstance.inProgressState) {
            inProgressTasks.addAll([allTasks.items[i]]);
          } else if (allTasks.items[i].state == AppConstance.finishedState) {
            finishedTasks.addAll([allTasks.items[i]]);
          }
        }

        emit(state.copyWith(
          waitingTasks: waitingTasks,
          inProgressTasks: inProgressTasks,
          finishedTasks: finishedTasks,
          getTaskState: RequestState.success,
        ));
      },
    );
  }

  ///=========== get task details ============///

  Future<void> getTaskDetails({required String id}) async {
    final result =
        await _getTaskDetailsUseCase.call(GetTaskDetailsParameter(id: id));
    result.fold(
      (failure) {
        emit(state.copyWith(
            taskDetailsFailureMessage: failure.message,
            taskDetailsState: RequestState.failure));
      },
      (taskDetails) {
        emit(state.copyWith(
          taskDetails: taskDetails,
          taskDetailsState: RequestState.success,
        ));
      },
    );
  }

  ///========== delete task ===========///
  Future<void> deleteTask({required String id}) async {
    emit(state.copyWith(
      deleteTaskState: BottomState.loading,
    ));
    final result = await _deleteTaskUseCase.call(DeleteTaskParameter(id: id));
    result.fold(
      (failure) {
        emit(state.copyWith(
            deleteTaskFailureMessage: failure.message,
            deleteTaskState: BottomState.failure));
      },
      (taskDetails) {
        emit(state.copyWith(
          deleteTaskState: BottomState.success,
        ));
      },
    );
  }
}
