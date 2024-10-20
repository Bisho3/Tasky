import 'package:todo/core/util/app_import.dart';

class TaskTitleFieldComponent extends StatelessWidget {
  const TaskTitleFieldComponent({super.key, required this.taskTitleController});

  final TextEditingController taskTitleController;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.text,
      controller: taskTitleController,
      validate: (text) {
        if (text!.isEmpty) {
          return AppStrings.mustEnterTitle;
        }
        return null;
      },
      text: AppStrings.enterTitleHere,
      descriptionField: AppStrings.taskTitle,
    );
  }
}
