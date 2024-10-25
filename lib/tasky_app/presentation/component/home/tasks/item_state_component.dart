import 'package:todo/core/util/app_import.dart';

class ItemStateComponent extends StatelessWidget {
  const ItemStateComponent({super.key, required this.taskStates});

  final TaskStates taskStates;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          vertical: AppDouble.two.w, horizontal: AppDouble.eight.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDouble.five.w),
        color: getTaskStateBackGroundColor(taskStates),
      ),
      child: Text(
        getTaskStateText(taskStates),
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: getTaskStateTextColor(taskStates)),
      ),
    );
  }
}

String getTaskStateText(TaskStates taskStates) {
  switch (taskStates) {
    case TaskStates.waiting:
      return AppStrings.waiting;
    case TaskStates.inProgress:
      return AppStrings.inProgress;
    case TaskStates.finished:
      return AppStrings.finished;
  }
}

Color getTaskStateTextColor(TaskStates taskStates) {
  switch (taskStates) {
    case TaskStates.waiting:
      return AppColors.deepOrangeColor;
    case TaskStates.inProgress:
      return AppColors.primaryColor;
    case TaskStates.finished:
      return AppColors.blueColor;
  }
}

Color getTaskStateBackGroundColor(TaskStates taskStates) {
  switch (taskStates) {
    case TaskStates.waiting:
      return AppColors.orangeColor;
    case TaskStates.inProgress:
      return AppColors.lightPrimaryColor;
    case TaskStates.finished:
      return AppColors.lightBlueColor;
  }
}
