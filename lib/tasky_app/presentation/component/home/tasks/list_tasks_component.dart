import 'package:todo/core/util/app_import.dart';

class ListTasksComponent extends StatelessWidget {
  ListTasksComponent({super.key});

  final GlobalKey<RefreshIndicatorState> _globalKey =
      GlobalKey<RefreshIndicatorState>();

  List<dynamic> _getTaskList(TaskyState state) {
    switch (state.selectHeaderProgress) {
      case AppIntegers.zero:
        return state.tasks.items;
      case AppIntegers.one:
        return state.inProgressTasks;
      case AppIntegers.two:
        return state.waitingTasks;
      case AppIntegers.three:
        return state.finishedTasks;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskyCubit, TaskyState>(
        buildWhen: (previous, current) =>
            previous.getTaskState != current.getTaskState ||
            previous.tasks != current.tasks ||
            previous.selectHeaderProgress != current.selectHeaderProgress,
        builder: (context, state) {
          switch (state.getTaskState) {
            case RequestState.loading:
              return const LoadingTasksComponent();
            case RequestState.success:
              final taskList = _getTaskList(state);
              if (taskList.isNotEmpty) {
                return AdaptiveRefresh(
                  oS: getOs(),
                  onRefresh: () async {
                    context.read<TaskyCubit>().getTask();
                    context.read<TaskyCubit>().selectedHeaderProgress(index: 0);
                  },
                  keyRefresh: _globalKey,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemTaskComponent(
                            itemTasks: taskList[index],
                          ),
                      separatorBuilder: (context, index) =>
                          verticalSpace(AppDouble.ten),
                      itemCount: taskList.length),
                );
              } else {
                return Text(
                  AppStrings.noTasks,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                );
              }
            case RequestState.failure:
              return CustomFailureText(
                failureText: state.getTaskFailureMessage,
              );
          }
        },
      ),
    );
  }
}
