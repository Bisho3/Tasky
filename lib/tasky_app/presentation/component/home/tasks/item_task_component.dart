import 'package:intl/intl.dart';
import 'package:todo/core/util/app_import.dart';

class ItemTaskComponent extends StatelessWidget {
  const ItemTaskComponent({
    super.key,
    required this.itemTasks,
  });

  final ItemTask itemTasks;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
            routeName: Routes.taskDetailsScreen,
            arguments: {KeyRouter.taskIdInTaskDetailsScreen: itemTasks.id,
              KeyRouter.contextInTaskDetailsScreen: context
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            image: AppConstance.baseImageUrl(image: itemTasks.image),
            shape: BoxShape.circle,
            height: AppDouble.sixty.h,
            width: AppDouble.sixty.w,
          ),
          horizontalSpace(AppDouble.five),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                        itemTasks.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    horizontalSpace(AppDouble.ten),
                    ItemStateComponent(
                      taskStates: itemTasks.state == AppConstance.waitingState
                          ? TaskStates.waiting
                          : itemTasks.state == AppConstance.inProgressState
                              ? TaskStates.inProgress
                              : TaskStates.finished,
                    ),
                  ],
                ),
                verticalSpace(AppDouble.five),
                Text(
                  itemTasks.description,
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: AppIntegers.one,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(AppDouble.five),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemPriorityComponent(
                      priorityStates: itemTasks.priority ==
                              AppConstance.lowPriority
                          ? PriorityStates.low
                          : itemTasks.priority == AppConstance.mediumPriority
                              ? PriorityStates.medium
                              : PriorityStates.high,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(itemTasks.duiDate))
                          .toString(),
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: AppIntegers.one,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          horizontalSpace(AppDouble.three),
          CustomPopUpTask(
            onTapEdit: () {},
            onTapDelete: () {
              alertDialogDeleteTaskComponent(
                id: itemTasks.id,
                mainContext: context,
                isInHome: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
