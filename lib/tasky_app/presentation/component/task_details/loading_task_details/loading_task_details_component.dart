import 'package:todo/core/util/app_import.dart';

class LoadingTaskDetailsComponent extends StatelessWidget {
  const LoadingTaskDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            image: AppConstance.baseImageUrl(image: "state.taskDetails!.image"),
          ),
          verticalSpace(AppDouble.fifteen),
          Text(
            "Grocery Shopping App",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpace(AppDouble.five),
          Text(
            "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          verticalSpace(AppDouble.ten),
          const ItemCardComponent(
            wantTitle: true,
            title: "state.taskDetails!.duiDate",
          ),
          verticalSpace(AppDouble.ten),
          const ItemCardComponent(
            title: "low",
            wantArrow: true,
          ),
          verticalSpace(AppDouble.ten),
          const ItemCardComponent(
            title: "waiting",
            wantArrow: true,
            wantPrefixIcon: true,
          ),
        ],
      ),
    );
  }
}
