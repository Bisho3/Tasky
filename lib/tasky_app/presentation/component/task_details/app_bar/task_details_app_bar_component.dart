import 'package:todo/core/util/app_import.dart';

class TaskDetailsAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const TaskDetailsAppBarComponent({super.key, required this.mainContext});

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: const CustomBack(),
      textTitle: AppStrings.taskDetails,
      trailing: BlocBuilder<TaskyCubit, TaskyState>(
        buildWhen: (previous, current) =>
            previous.taskDetailsState != current.taskDetailsState,
        builder: (context, state) {
          return CustomPopUpTask(
            onTapEdit: () {},
            onTapDelete: () {
              alertDialogDeleteTaskComponent(
                id: state.taskDetails!.id,
                mainContext: context,
                isInHome: false,
                previousContext: mainContext,
              );
            },
          );
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
