import 'package:todo/core/util/app_import.dart';

void alertDialogDeleteTaskComponent({
  required BuildContext mainContext,
  required String id,
  required bool isInHome,
  BuildContext? previousContext,
}) {
  showDialog(
    context: mainContext,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: mainContext.read<TaskyCubit>(),
        child: AlertDialog(
          title: Text(
            AppStrings.deleteTask,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            AppStrings.areYouSureYouWantToDelete,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(AppStrings.cancel),
              onPressed: () {
                context.pop();
              },
            ),
            BlocConsumer<TaskyCubit, TaskyState>(
              buildWhen: (previous, current) =>
                  previous.deleteTaskState != current.deleteTaskState,
              listenWhen: (previous, current) =>
                  previous.deleteTaskState != current.deleteTaskState,
              listener: (context, state) {
                if (state.deleteTaskState == BottomState.success) {
                  context.pop();
                  if (isInHome == true) {
                    mainContext.read<TaskyCubit>().getTask();
                  } else {
                    context.pop();
                    previousContext!.read<TaskyCubit>().getTask();
                  }
                }
              },
              builder: (context, state) {
                return TextButton(
                  child: const Text(
                    AppStrings.delete,
                  ),
                  onPressed: () {
                    mainContext.read<TaskyCubit>().deleteTask(id: id);
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
