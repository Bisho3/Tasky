import 'package:todo/core/util/app_import.dart';

class RegisterPhoneFieldComponent extends StatelessWidget {
  const RegisterPhoneFieldComponent({super.key, required this.phoneNumberController});
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
      previous.countryCode != current.countryCode,
      builder: (context, state) {
        return CustomFormField(
          type: TextInputType.phone,
          controller: phoneNumberController,
          validate: (value) {
            if (value!.isEmpty) {
              return AppStrings.emptyPhoneNumber;
            } else if (CustomCheckPhoneNumber.validNumberPhone(
                "${state.countryCode}$value") ==
                false) {
              return AppStrings.phoneNumberIsIncorrect;
            }
            return null;
          },
          text: AppStrings.digitNumber,
          wantDigitOnly: true,
          showCountry: true,
        );
      },
    );
  }
}
