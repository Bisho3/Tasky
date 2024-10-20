import 'package:todo/core/util/app_import.dart';

class RegisterAddressFieldComponent extends StatelessWidget {
  const RegisterAddressFieldComponent({super.key, required this.addressController});
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      type: TextInputType.streetAddress,
      controller: addressController,
      validate: (value) {
        if (value!.isEmpty) {
          return AppStrings.emptyAddress;
        }
        return null;
      },
      text: AppStrings.address,
    );
  }
}
