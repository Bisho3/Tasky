import 'package:todo/core/util/app_import.dart';

class LoadingTasksComponent extends StatelessWidget {
  const LoadingTasksComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                image: "https://picsum.photos/200/300",
                shape: BoxShape.circle,
                height: AppDouble.sixty.h,
                width: AppDouble.sixty.w,
              ),
              horizontalSpace(AppDouble.five),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            "",
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        horizontalSpace(AppDouble.ten),
                        ItemStateComponent(
                          taskStates: TaskStates.finished,
                        ),
                      ],
                    ),
                    verticalSpace(AppDouble.five),
                    Text(
                      "itemTasks.description",
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: AppIntegers.one,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(AppDouble.five),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemPriorityComponent(
                          priorityStates:
                          PriorityStates.high,
                        ),
                        Text(
                          "13/12/2024",
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
              PopupMenuButton(
                itemBuilder: (context) => [],
              ),
            ],
          ),
          separatorBuilder: (context, index) =>
              verticalSpace(AppDouble.ten),
          itemCount: AppIntegers.three),
    );
  }
}
