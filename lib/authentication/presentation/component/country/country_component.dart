import 'package:todo/core/util/app_import.dart';

class CountryComponent extends StatelessWidget {
  const CountryComponent({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      flagWidth: AppDouble.twenty.h,
      showCountryOnly: false,
      hideMainText: false,
      initialSelection: 'EG',
      favorite: const ["EG", "SA"],
      showDropDownButton: true,
      enabled: true,
      showFlagDialog: true,
      onChanged: (value) {
        context.read<AuthCubit>().getCountryCode(value.dialCode!);
      },
      dialogTextStyle: Theme.of(context).textTheme.labelLarge,
      onInit: (value) {
        context.read<AuthCubit>().getCountryCode(value!.dialCode!);
      },
      searchDecoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 1.sw > 600 ? 0.03.sw : 0.05.sw,
            vertical: 1.sw > 600 ? 0.020.sh : 0.010.sh,
          ),
          hintText: AppStrings.search,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontSize: AppDouble.twelve.sp),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.veryLightGreyColor),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.veryLightGreyColor),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.veryLightGreyColor),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
