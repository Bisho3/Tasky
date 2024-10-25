import 'package:todo/core/util/app_import.dart';

class ListHeaderProgressComponent extends StatelessWidget {
  const ListHeaderProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskyCubit, TaskyState>(
      builder: (context, state) {
        return SizedBox(
          height: AppDouble.thirtyFive.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ItemHeaderProgressComponent(
              text: state.listHeaderProgress[index],
              isActive: state.selectHeaderProgress == index ? true : false,
              onTap: () {
                context.read<TaskyCubit>().selectedHeaderProgress(index: index);
              },
            ),
            separatorBuilder: (context, index) =>
                horizontalSpace(AppDouble.eight),
            itemCount: state.listHeaderProgress.length,
          ),
        );
      },
    );
  }
}
