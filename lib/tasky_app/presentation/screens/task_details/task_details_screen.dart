import 'package:intl/intl.dart';
import 'package:todo/core/util/app_import.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.id, required this.mainContext});

  final String id;
  final BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<TaskyCubit>()
        ..getTaskDetails(id: id),
      child: Scaffold(
        appBar:  TaskDetailsAppBarComponent(
          mainContext:mainContext,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.all(AppDouble.twenty.w),
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<TaskyCubit, TaskyState>(
            buildWhen: (previous, current) =>
            previous.taskDetailsState != current.taskDetailsState,
            builder: (context, state) {
              switch (state.taskDetailsState) {
                case RequestState.loading:
                  return const LoadingTaskDetailsComponent();
                case RequestState.success:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomNetworkImage(
                        image: AppConstance.baseImageUrl(
                            image: state.taskDetails!.image),
                      ),
                      verticalSpace(AppDouble.fifteen),
                      Text(
                        state.taskDetails!.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                      verticalSpace(AppDouble.five),
                      Text(
                        state.taskDetails!.description,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                      ),
                      verticalSpace(AppDouble.ten),
                      ItemCardComponent(
                        wantTitle: true,
                        title: DateFormat('yyyy-MM-dd')
                            .format(DateTime.parse(state.taskDetails!.duiDate))
                            .toString(),
                      ),
                      verticalSpace(AppDouble.ten),
                      ItemCardComponent(
                        title: state.taskDetails!.priority,
                        wantArrow: true,
                      ),
                      verticalSpace(AppDouble.ten),
                      ItemCardComponent(
                        title: state.taskDetails!.state,
                        wantArrow: true,
                        wantPrefixIcon: true,
                      ),
                      verticalSpace(AppDouble.ten),
                      QrImageView(
                        data: state.taskDetails!.id,
                        version: QrVersions.auto,
                        size: AppDouble.threeHundredAndSixty.h,
                      ),
                    ],
                  );
                case RequestState.failure:
                  return CustomFailureText(
                    failureText: state.taskDetailsFailureMessage,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
