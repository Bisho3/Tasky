import 'package:todo/core/util/app_import.dart';

class PriorityComponent extends StatelessWidget {
  const PriorityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskyCubit, TaskyState>(
      buildWhen: (previous, current) =>
          previous.selectedPriority != current.selectedPriority,
      builder: (context, state) {
        return CustomDropDown(
          listItems: state.priority,
          backgroundColor: AppColors.roseColor,
          wantFilled: true,
          textHint: AppStrings.mediumPriority,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.mustChooseMediumPriority;
            }

            return null;
          },
          onChange: (value) {
            context.read<TaskyCubit>().selectedPriority(priority: value);
          },
        );
      },
    );
  }
}
