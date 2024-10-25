import 'package:todo/core/util/app_import.dart';

class CustomFormField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String? value) validate;
  final String? text;
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
  final String? descriptionField;
  final String? suffixSvg;

  const CustomFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    required this.text,
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
    this.descriptionField,
    this.suffixSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (descriptionField != null)
          Text(
            descriptionField.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        if (descriptionField != null) verticalSpace(AppDouble.one),
        Container(
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
              suffixIcon: suffixIcon != null || suffixSvg != null
                  ? suffixIcon != null
                      ? IconButton(
                          icon: Icon(
                            suffixIcon,
                            size: 22.w,
                          ),
                          onPressed: () {
                            suffixOnPressed!();
                          },
                        )
                      : GestureDetector(
                          onTap: () {
                            suffixOnPressed!();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                suffixSvg!,
                              ),
                            ],
                          ),
                        )
                  :  null,
            ),
            expands: false,
            minLines: null,
            maxLines: multiline == false ? 1 : 5,
            maxLength: maxLength,
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }
}
