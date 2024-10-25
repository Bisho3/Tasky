import 'package:todo/core/util/app_import.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, required this.previousContext});

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final BuildContext previousContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskyCubit>(),
      child: Scaffold(
        appBar: const AddTaskAppBarComponent(),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(AppDouble.fifteen.h),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const AddImageComponent(),
                verticalSpace(AppDouble.fifteen),
                TaskTitleFieldComponent(
                  taskTitleController: _taskTitleController,
                ),
                verticalSpace(AppDouble.fifteen),
                TaskDescriptionFieldComponent(
                  taskDescriptionController: _taskDescriptionController,
                ),
                verticalSpace(AppDouble.fifteen),
                const PriorityComponent(),
                verticalSpace(AppDouble.fifteen),
                DueDateComponent(
                  dueDateController: _dueDateController,
                ),
                const TextFailureAddTaskComponent(),
                verticalSpace(AppDouble.twenty),
                BottomAddTaskComponent(
                  formKey: _formKey,
                  dueDateController: _dueDateController,
                  taskDescriptionController: _taskDescriptionController,
                  taskTitleController: _taskTitleController,
                  previousContext: previousContext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
