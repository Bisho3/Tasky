import 'package:todo/core/util/app_import.dart';

class RegisterYourExperienceFieldComponent extends StatelessWidget {
  const RegisterYourExperienceFieldComponent({super.key, required this.yearsOfExperienceController});
  final TextEditingController yearsOfExperienceController ;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.text,
      controller: yearsOfExperienceController,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.emptyYearOfExperience;
        }
        return null;
      },
      text: AppStrings.yearOfExperience,
      wantDigitOnly: true,
    );
  }
}
