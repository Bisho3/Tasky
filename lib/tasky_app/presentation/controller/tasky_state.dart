part of 'tasky_cubit.dart';

class TaskyState extends Equatable {
  final File? uploadImage;
  final UploadImageStates failureImage;
  final BottomState removeImageState;
  final List<String> priority;
  final String? selectedPriority;
  final BottomState addTaskState;
  final String addTaskFailureMessage;
  final String? imagePath;
  final String uploadImageFailureMessage;
  final List<String> listHeaderProgress;
  final int selectHeaderProgress;
  final ToggleStates selectHeaderProgressState;

  final Tasks tasks;
  final List<ItemTask> inProgressTasks;
  final List<ItemTask> waitingTasks;
  final List<ItemTask> finishedTasks;
  final RequestState getTaskState;
  final String getTaskFailureMessage;

  final TaskDetails? taskDetails;
  final RequestState taskDetailsState;
  final String taskDetailsFailureMessage;

  final BottomState deleteTaskState;
  final String deleteTaskFailureMessage;

  const TaskyState({
    this.uploadImage,
    this.failureImage = UploadImageStates.isInitial,
    this.removeImageState = BottomState.isInitial,
    this.priority = const ["low", "medium", "high"],
    this.selectedPriority,
    this.addTaskState = BottomState.isInitial,
    this.addTaskFailureMessage = "",
    this.imagePath,
    this.uploadImageFailureMessage = "",
    this.listHeaderProgress = const [
      AppStrings.all,
      AppStrings.inProgress,
      AppStrings.waiting,
      AppStrings.finished,
    ],
    this.selectHeaderProgress = AppIntegers.zero,
    this.selectHeaderProgressState = ToggleStates.isStarted,
    this.tasks = const Tasks(items: []),
    this.inProgressTasks = const [],
    this.waitingTasks = const [],
    this.finishedTasks = const [],
    this.getTaskState = RequestState.loading,
    this.getTaskFailureMessage = "",
    this.taskDetails,
    this.taskDetailsState = RequestState.loading,
    this.taskDetailsFailureMessage = "",
    this.deleteTaskState = BottomState.isInitial,
    this.deleteTaskFailureMessage = "",
  });

  TaskyState copyWith({
    File? uploadImage,
    UploadImageStates? failureImage,
    BottomState? removeImageState,
    List<String>? priority,
    String? selectedPriority,
    BottomState? addTaskState,
    String? addTaskFailureMessage,
    String? imagePath,
    String? uploadImageFailureMessage,
    List<String>? listHeaderProgress,
    int? selectHeaderProgress,
    ToggleStates? selectHeaderProgressState,
    Tasks? tasks,
    List<ItemTask>? inProgressTasks,
    List<ItemTask>? waitingTasks,
    List<ItemTask>? finishedTasks,
    RequestState? getTaskState,
    String? getTaskFailureMessage,
    TaskDetails? taskDetails,
    RequestState? taskDetailsState,
    String? taskDetailsFailureMessage,
    BottomState? deleteTaskState,
    String? deleteTaskFailureMessage,
  }) {
    return TaskyState(
        uploadImage: uploadImage ?? this.uploadImage,
        failureImage: failureImage ?? this.failureImage,
        removeImageState: removeImageState ?? this.removeImageState,
        priority: priority ?? this.priority,
        selectedPriority: selectedPriority ?? this.selectedPriority,
        addTaskState: addTaskState ?? this.addTaskState,
        addTaskFailureMessage:
            addTaskFailureMessage ?? this.addTaskFailureMessage,
        imagePath: imagePath ?? this.imagePath,
        uploadImageFailureMessage:
            uploadImageFailureMessage ?? this.uploadImageFailureMessage,
        listHeaderProgress: listHeaderProgress ?? this.listHeaderProgress,
        selectHeaderProgress: selectHeaderProgress ?? this.selectHeaderProgress,
        selectHeaderProgressState:
            selectHeaderProgressState ?? this.selectHeaderProgressState,
        tasks: tasks ?? this.tasks,
        getTaskState: getTaskState ?? this.getTaskState,
        getTaskFailureMessage:
            getTaskFailureMessage ?? this.getTaskFailureMessage,
        inProgressTasks: inProgressTasks ?? this.inProgressTasks,
        waitingTasks: waitingTasks ?? this.waitingTasks,
        finishedTasks: finishedTasks ?? this.finishedTasks,
        taskDetails: taskDetails ?? this.taskDetails,
        taskDetailsState: taskDetailsState ?? this.taskDetailsState,
        taskDetailsFailureMessage:
            taskDetailsFailureMessage ?? this.taskDetailsFailureMessage,
        deleteTaskState: deleteTaskState ?? this.deleteTaskState,
        deleteTaskFailureMessage:
            deleteTaskFailureMessage ?? this.deleteTaskFailureMessage);
  }

  @override
  List<Object?> get props => [
        uploadImage,
        failureImage,
        removeImageState,
        priority,
        selectedPriority,
        addTaskState,
        addTaskFailureMessage,
        imagePath,
        uploadImageFailureMessage,
        listHeaderProgress,
        selectHeaderProgress,
        selectHeaderProgressState,
        tasks,
        getTaskState,
        getTaskFailureMessage,
        inProgressTasks,
        waitingTasks,
        finishedTasks,
        taskDetails,
        taskDetailsState,
        taskDetailsFailureMessage,
        deleteTaskState,
        deleteTaskFailureMessage,
      ];
}
