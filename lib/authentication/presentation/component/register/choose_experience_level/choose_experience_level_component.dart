import 'package:todo/core/util/app_import.dart';

class ChooseExperienceLevelComponent extends StatelessWidget {
  const ChooseExperienceLevelComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.selectedExperienceLevel != current.selectedExperienceLevel,
      builder: (context, state) {
        return CustomDropDown(
          listItems: state.experienceLevel,
          textHint: AppStrings.chooseExperienceLevel,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.emptyChooseExperienceLevel;
            }

            return null;
          },
          onChange: (value) {
            context
                .read<AuthCubit>()
                .chooseExperienceLevel(experienceLevel: value);
          },
        );
      },
    );
  }
}
