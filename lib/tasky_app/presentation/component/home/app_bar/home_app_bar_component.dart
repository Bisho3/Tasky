import 'package:todo/core/util/app_import.dart';

class HomeAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Text(AppStrings.appName),
          const Spacer(),
          GestureDetector(
              onTap: () => context.pushNamed(routeName: Routes.profileScreen),
              child: SvgPicture.asset(AppIcons.accountIcon)),
          horizontalSpace(AppDouble.fifteen),
          GestureDetector(
              onTap: () {
                showSignOutDialog(context: context);
              },
              child: SvgPicture.asset(AppIcons.logoutIcon)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
