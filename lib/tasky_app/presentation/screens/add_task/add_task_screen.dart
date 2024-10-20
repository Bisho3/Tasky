import 'package:todo/core/util/app_import.dart';
import 'package:todo/tasky_app/presentation/component/add_task/priority/priority_component.dart';
import 'package:todo/tasky_app/presentation/component/add_task/task_description_field/task_description_field_component.dart';
import 'package:todo/tasky_app/presentation/component/add_task/task_title_field/task_title_field_component.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskyCubit>(),
      child: Scaffold(
        appBar: const AddTaskAppBarComponent(),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(AppDouble.fifteen.h),
          child: Column(
            children: [
              const AddImageComponent(),
              verticalSpace(AppDouble.ten),
              TaskTitleFieldComponent(
                taskTitleController: _taskTitleController,
              ),
              verticalSpace(AppDouble.ten),
              TaskDescriptionFieldComponent(
                taskDescriptionController: _taskDescriptionController,
              ),
              verticalSpace(AppDouble.ten),
              const PriorityComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
