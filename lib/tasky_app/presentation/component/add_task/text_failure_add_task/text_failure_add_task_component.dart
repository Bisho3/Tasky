import 'package:todo/core/util/app_import.dart';

class TextFailureAddTaskComponent extends StatelessWidget {
  const TextFailureAddTaskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskyCubit, TaskyState>(
      buildWhen: (previous, current) =>
          previous.addTaskState != current.addTaskState,
      builder: (context, state) {
        if (state.addTaskState != BottomState.failure) {
          return const SizedBox();
        } else {
          return CustomFailureText(
            failureText: state.addTaskFailureMessage,
          );
        }
      },
    );
  }
}
