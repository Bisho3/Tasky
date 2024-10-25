import 'package:intl/intl.dart';
import 'package:todo/core/util/app_import.dart';

class DueDateComponent extends StatelessWidget {
  const DueDateComponent({super.key, required this.dueDateController});

  final TextEditingController dueDateController;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.datetime,
      controller: dueDateController,
      validate: (text) {
        if (text!.isEmpty) {
          return AppStrings.mustChooseDueDate;
        }
        return null;
      },
      text: AppStrings.chooseDueDate,
      descriptionField: AppStrings.dueDate,
      suffixSvg: AppIcons.calendarIcon,
      onTap: () {
        showDate(context: context);
      },
      suffixOnPressed: () {
        showDate(context: context);
      },
    );
  }

  Future<void> showDate({
    required BuildContext context,
  }) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((value) {
      String newDate = DateFormat('yyyy-MM-dd').format(value!).toString();
      dueDateController.text = newDate;
    });
  }
}
