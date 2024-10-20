import 'package:todo/core/util/app_import.dart';

class CardItemComponent extends StatelessWidget {
  const CardItemComponent(
      {super.key,
      required this.ask,
      required this.answer,
      this.wantCopy = false});

  final String ask;
  final String answer;
  final bool wantCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(AppDouble.fifteen.w),
      decoration: BoxDecoration(
        color: AppColors.veryLightGreyColor,
        borderRadius: BorderRadius.circular(AppDouble.fifteen.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ask.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.greyColor.withOpacity(0.8),
                      ),
                ),
                verticalSpace(AppDouble.five),
                Text(
                  answer,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (wantCopy == true) const Spacer(),
          if (wantCopy == true)
            GestureDetector(
                onTap: () {
                  customCopyText(text: answer);
                },
                child: SvgPicture.asset(AppIcons.copyIcon)),
        ],
      ),
    );
  }
}
