import 'package:todo/core/util/app_import.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> listItems;
  final FormFieldValidator validator;
  final Function onChange;
  final String? initialValue;
  final String textHint;
  final Color backgroundColor;
  final bool wantFilled;

  const CustomDropDown({
    super.key,
    required this.listItems,
    required this.validator,
    required this.onChange,
    this.initialValue,
    required this.textHint,
    this.backgroundColor = AppColors.foreignLightColor,
    this.wantFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: initialValue,
      hint: Padding(
        padding: EdgeInsets.only(
          left: AppDouble.eight.w,
        ),
        child: Text(
          textHint.toString(),
          style: wantFilled
              ? Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.primaryColor)
              : Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ),
      dropdownColor: backgroundColor,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: AppDouble.ten.w,
          ),
          child: SvgPicture.asset(AppIcons.priorityIcon),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        filled: wantFilled,
        fillColor: AppColors.roseColor,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(AppDouble.twelve)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: wantFilled ? AppColors.roseColor : AppColors.greyColor),
            borderRadius: BorderRadius.circular(AppDouble.twelve)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: wantFilled ? AppColors.roseColor : AppColors.greyColor),
            borderRadius: BorderRadius.circular(AppDouble.twelve)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: wantFilled ? AppColors.roseColor : AppColors.greyColor),
            borderRadius: BorderRadius.circular(AppDouble.twelve)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 1.sw > 600 ? 0.03.sw : 0.05.sw,
          vertical: 1.sw > 600 ? 0.025.sh : 0.013.sh,
        ),
      ),
      items: listItems
          .toSet()
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDouble.ten.w,
                ),
                child: Text(
                  e.toString(),
                  style: wantFilled
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.primaryColor)
                      : Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                ),
              ),
            ),
          )
          .toList(),
      icon: Icon(
        wantFilled ? Icons.arrow_drop_down : Icons.expand_more_outlined,
        color: Theme.of(context).primaryColor,
        size: wantFilled ? AppDouble.twentyFive.w : AppDouble.fifteen.w,
      ),
      style: Theme.of(context).textTheme.bodySmall,
      onChanged: (e) {
        onChange(e);
      },
    );
  }
}
