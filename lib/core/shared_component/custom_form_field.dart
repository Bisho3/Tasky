import 'package:todo/core/util/app_import.dart';

class CustomFormField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String? value) validate;
  final String? text;
  final Function? onFieldSubmit;
  final bool isPassword;
  final IconData? suffixIcon;
  final Function? suffixOnPressed;
  final bool? textLabel;
  final Function? onTap;
  final bool important;
  final bool multiline;
  final int? maxLength;
  final bool readOnly;
  final bool wantDigitOnly;
  final bool showCountry;
  final bool wantWhiteColor;

  const CustomFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    required this.text,
    this.onFieldSubmit,
    this.isPassword = false,
    this.suffixIcon,
    this.suffixOnPressed,
    this.textLabel = false,
    this.onTap,
    this.important = false,
    this.multiline = false,
    this.maxLength,
    this.readOnly = false,
    this.wantDigitOnly = false,
    this.showCountry = false,
    this.wantWhiteColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5.h, top: 8.h),
      color: wantWhiteColor == true ? AppColors.foreignLightColor : null,
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.blackColor),
        onTap: onTap != null
            ? () {
                onTap!();
              }
            : null,
        validator: (value) {
          return validate(value);
        },
        obscureText: isPassword,
        inputFormatters: wantDigitOnly != false
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : null,
        decoration: InputDecoration(
          hintText: textLabel == false ? text : null,
          label: textLabel != false
              ? Text(
                  text.toString(),
                )
              : null,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontSize: AppDouble.twelve.sp),
          prefixIcon: showCountry != false
              ? CountryComponent(
                  context: context,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    size: 22.w,
                  ),
                  onPressed: () {
                    suffixOnPressed!();
                  })
              : null,
        ),
        expands: false,
        minLines: null,
        maxLines: multiline == false ? 1 : 2,
        maxLength: maxLength,
        readOnly: readOnly,
      ),
    );
  }
}
