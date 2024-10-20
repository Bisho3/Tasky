import '../util/app_import.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.leading,
      this.textTitle,
      this.trailing,
      this.leadingWidth = 57});

  final Widget? leading;
  final String? textTitle;
  final Widget? trailing;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: AppDouble.zero,
      elevation: AppDouble.five,
      automaticallyImplyLeading: leading != null ? true : false,
      title: textTitle != null
          ? Row(
              children: [
                Text(
                  textTitle.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            )
          : null,
      leading: leading,
      leadingWidth: leadingWidth?.w,
      actions: trailing != null ? [trailing!] : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
