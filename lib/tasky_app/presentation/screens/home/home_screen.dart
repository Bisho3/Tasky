import 'package:todo/core/util/app_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocProvider(
        create: (context) => sl<TaskyCubit>()..getTask(),
        child: Scaffold(
          appBar: const HomeAppBarComponent(),
          body: Padding(
            padding: EdgeInsetsDirectional.all(AppDouble.twenty.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.myTasks,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                ),
                verticalSpace(AppDouble.fifteen),
                const ListHeaderProgressComponent(),
                verticalSpace(AppDouble.twenty),
                ListTasksComponent(),
              ],
            ),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: const FloatingBottomComponent(),
        ),
      ),
    );
  }
}
