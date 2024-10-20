import 'package:todo/core/util/app_import.dart';

class RegisterNameFieldComponent extends StatelessWidget {
  const RegisterNameFieldComponent({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.name,
      controller: nameController,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.emptyName;
        }
        return null;
      },
      text: AppStrings.name,
    );
  }
}
