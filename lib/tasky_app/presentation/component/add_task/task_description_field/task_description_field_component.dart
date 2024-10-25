import 'package:todo/core/util/app_import.dart';

class TaskDescriptionFieldComponent extends StatelessWidget {
  const TaskDescriptionFieldComponent(
      {super.key, required this.taskDescriptionController});

  final TextEditingController taskDescriptionController;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.multiline,
      controller: taskDescriptionController,
      validate: (text) {
        if (text!.isEmpty) {
          return AppStrings.mustEnterTaskDescription;
        }
        return null;
      },
      text: AppStrings.enterDescriptionHere,
      descriptionField: AppStrings.taskDescription,
      multiline: true,
    );
  }
}
