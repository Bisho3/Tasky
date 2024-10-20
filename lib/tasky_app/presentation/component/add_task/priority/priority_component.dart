import 'package:todo/core/util/app_import.dart';

class PriorityComponent extends StatelessWidget {
  const PriorityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
      listItems: ["1"],
      backgroundColor:  AppColors.roseColor,
      wantFilled:  true,
      textHint: AppStrings.mediumPriority,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.emptyChooseExperienceLevel;
        }

        return null;
      },
      onChange: (value) {
        context.read<AuthCubit>().chooseExperienceLevel(experienceLevel: value);
      },
    );
  }
}
