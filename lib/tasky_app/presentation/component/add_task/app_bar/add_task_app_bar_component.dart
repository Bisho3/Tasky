import 'package:todo/core/util/app_import.dart';

class AddTaskAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const AddTaskAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      leading: CustomBack(),
      textTitle: AppStrings.addNewTask,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
