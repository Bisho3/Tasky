import 'package:todo/core/util/app_import.dart';

class ItemPriorityComponent extends StatelessWidget {
  const ItemPriorityComponent({super.key, required this.priorityStates});

  final PriorityStates priorityStates;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.priorityIcon,
          color: getTaskPriorityTextColor(priorityStates),
          height:  AppDouble.fifteen.h,
        ),
        horizontalSpace(AppDouble.five),
        Text(
          getTaskPriorityText(priorityStates),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: getTaskPriorityTextColor(priorityStates),
              ),
        ),
      ],
    );
  }

  Color getTaskPriorityTextColor(PriorityStates priorityStates) {
    switch (priorityStates) {
      case PriorityStates.low:
        return AppColors.blueColor;
      case PriorityStates.medium:
        return AppColors.primaryColor;
      case PriorityStates.high:
        return AppColors.deepOrangeColor;
    }
  }
}

String getTaskPriorityText(PriorityStates priorityStates) {
  switch (priorityStates) {
    case PriorityStates.low:
      return AppStrings.low;
    case PriorityStates.medium:
      return AppStrings.medium;
    case PriorityStates.high:
      return AppStrings.high;
  }
}
