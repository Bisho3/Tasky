import 'package:todo/core/util/app_import.dart';

class BottomAddTaskComponent extends StatelessWidget {
  const BottomAddTaskComponent(
      {super.key,
      required this.taskTitleController,
      required this.taskDescriptionController,
      required this.dueDateController,
      required this.formKey,
      required this.previousContext});

  final TextEditingController taskTitleController;

  final TextEditingController taskDescriptionController;

  final TextEditingController dueDateController;

  final GlobalKey<FormState> formKey;
  final BuildContext previousContext;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskyCubit, TaskyState>(
      buildWhen: (previous, current) =>
          previous.addTaskState != current.addTaskState ||
          previous.uploadImage != current.uploadImage ||
          previous.selectedPriority != current.selectedPriority,
      listener: (context, state) {
        if (state.addTaskState == BottomState.success) {
          previousContext.read<TaskyCubit>().getTask();
          context.pop();
          showToast(
              text: AppStrings.taskHasBeenAddedSuccessfully,
              state: ToastStates.success);
        }
      },
      builder: (context, state) {
        return CustomMaterialButton(
          function: () {
            if (state.uploadImage != null &&
                state.uploadImage!.path.isNotEmpty) {
              if (formKey.currentState!.validate()) {
                context.read<TaskyCubit>().addTask(
                      image: state.uploadImage!,
                      taskTitle: taskTitleController.text,
                      taskDescription: taskDescriptionController.text,
                      priority: state.selectedPriority!,
                      duiDate: dueDateController.text,
                    );
              }
            } else {
              context.read<TaskyCubit>().addTaskWithImage(
                    image: state.uploadImage,
                  );
            }
          },
          text: AppStrings.addTask,
          loading: state.addTaskState == BottomState.loading,
        );
      },
    );
  }
}
