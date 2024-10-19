import '../util/app_import.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.leading,
      this.bottom,
      this.textTitle,
      this.trailing,
      this.title,
      this.leadingWidth = 57});

  final Widget? leading;
  final Widget? bottom;
  final String? textTitle;
  final Widget? trailing;
  final Widget? title;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: AppDouble.zero,
      elevation: AppDouble.five,
      automaticallyImplyLeading: leading != null ? true : false,
      title: textTitle != null || title != null
          ? textTitle != null
              ? Text(
                  textTitle.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                )
              : title
          : null,
      leading: leading,
      leadingWidth: leadingWidth?.w,
      actions: trailing != null ? [trailing!] : null,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(0.8.sh),
              child: bottom!,
            )
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : 80.h);
}
