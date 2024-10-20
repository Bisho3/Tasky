import 'package:todo/core/util/app_import.dart';

class LoadingProfileComponent extends StatelessWidget {
  const LoadingProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: AppIntegers.five,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Skeletonizer(
          enabled: true,
          child: CardItemComponent(
            ask: AppStrings.name,
            answer: AppStrings.name,
          ),
        );
      },
      separatorBuilder: (context, index) =>
          verticalSpace(AppDouble.ten),
    );
  }
}
