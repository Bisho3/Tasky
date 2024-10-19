import 'package:todo/core/util/app_import.dart';

class CustomFormField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String? value) validate;
  final String? text;
  final IconData? prefixIcon;
  final bool isPassword;
  final IconData? suffixIcon;
  final String? suffixImageIcon;
  final String? prefixSvg;
  final Function? suffixOnPressed;
  final bool multiline;
  final int? maxLength;
  final bool wantDigitOnly;
  final bool wantOnlyEmail;
  final bool readOnly;
  final String? suffixSvg;
  final Function? onClickKeyBoard;
  final bool wantCodeCountry;
  final Function? onChange;
  final String? descriptionField;
  final String? newIcon;
  final String? newPrefixText;
  final Color? coverIconColor;
  final double paddingCover;
  final Color? newIconColor;
  final bool wantOnlyHintText;
  final bool loading;
  final Function? onTapNewIcon;

  const CustomFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    this.text,
    this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
    this.suffixOnPressed,
    this.multiline = false,
    this.maxLength,
    this.wantDigitOnly = false,
    this.wantOnlyEmail = false,
    this.suffixImageIcon,
    this.prefixSvg,
    this.readOnly = false,
    this.suffixSvg,
    this.onClickKeyBoard,
    this.wantCodeCountry = false,
    this.onChange,
    this.descriptionField,
    this.newIcon,
    this.coverIconColor,
    this.paddingCover = AppDouble.twenty,
    this.newIconColor,
    this.wantOnlyHintText = false,
    this.newPrefixText,
    this.loading = false,
    this.onTapNewIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (descriptionField != null)
          Text(
            descriptionField!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        Container(
          alignment: Alignment.center,
          margin:
              EdgeInsets.only(bottom: AppDouble.five.h, top: AppDouble.eight.h),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // if (wantCodeCountry == true ||
                //     newIcon != null ||
                //     newPrefixText != null)
                //   GestureDetector(
                //     onTap: onTapNewIcon != null
                //         ? () {
                //             onTapNewIcon!();
                //           }
                //         : null,
                //     child: Container(
                //       height: double.infinity,
                //       padding: EdgeInsetsDirectional.symmetric(
                //         horizontal: paddingCover.w,
                //       ),
                //       decoration: BoxDecoration(
                //         color: coverIconColor,
                //         borderRadius: BorderRadiusDirectional.only(
                //           topStart: Radius.circular(AppDouble.five.h),
                //           bottomStart: Radius.circular(AppDouble.five.h),
                //         ),
                //       ),
                //       child: Center(
                //         child: wantCodeCountry == true
                //             ? Text('${generateCountryCodeComponent()} +02',
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .titleMedium!
                //                     .copyWith(
                //                       color: AppColors.whiteColor,
                //                     ))
                //             : newIcon != null
                //                 ? newIcon?.contains(".svg") == true
                //                     ? SvgPicture.asset(
                //                         newIcon!,
                //                         color: newIconColor,
                //                       )
                //                     : Image.asset(
                //                         newIcon!,
                //                         color: newIconColor,
                //                       )
                //                 : loading == false
                //                     ? Text(
                //                         newPrefixText!,
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .titleMedium!
                //                             .copyWith(color: newIconColor),
                //                       )
                //                     : Center(
                //                         child: SpinKitThreeBounce(
                //                             color: AppColors.whiteColor,
                //                             size:
                //                                 1.sw < 600 ? 0.05.sh : 0.06.sh),
                //                       ),
                //       ),
                //     ),
                //   ),
                Expanded(
                  child: TextFormField(
                    keyboardType: type,
                    controller: controller,
                    style: Theme.of(context).textTheme.titleMedium,
                    validator: (value) {
                      return validate(value);
                    },
                    obscureText: isPassword,
                    onChanged: onChange != null
                        ? (value) {
                            onChange!(value);
                          }
                        : null,
                    inputFormatters: wantDigitOnly || wantOnlyEmail
                        ? wantDigitOnly
                            ? <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ]
                            : <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9@._]')),
                              ]
                        : null,
                    onFieldSubmitted: onClickKeyBoard != null
                        ? (value) {
                            onClickKeyBoard!(value);
                          }
                        : null,
                    decoration: InputDecoration(
                      labelText: wantOnlyHintText == false ? text : null,
                      hintText: wantOnlyHintText == true ? text : null,
                      prefixIcon: prefixIcon != null || prefixSvg != null
                          ? prefixIcon != null
                              ? Icon(
                                  prefixIcon,
                                  size: 22.w,
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      prefixSvg!,
                                    ),
                                  ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        suffixSvg!,
                                      ),
                                    ],
                                  ),
                                )
                          : suffixImageIcon != null
                              ? GestureDetector(
                                  onTap: () {
                                    suffixOnPressed!();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        suffixImageIcon!,
                                        color:  AppColors.blackColor,
                                      ),
                                    ],
                                  ),
                                )
                              : null,
                    ),
                    expands: false,
                    minLines: null,
                    maxLines: multiline ? 2 : 1,
                    maxLength: maxLength,
                    readOnly: readOnly,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
