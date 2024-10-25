import 'package:todo/core/util/app_import.dart';

class BottomRegisterComponent extends StatelessWidget {
  const BottomRegisterComponent(
      {super.key,
      required this.phoneNumberController,
      required this.passwordController,
      required this.nameController,
      required this.yearExperienceController,
      required this.addressController,
      required this.formKey});

  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController yearExperienceController;
  final TextEditingController addressController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.registerState != current.registerState ||
          previous.selectedExperienceLevel != current.selectedExperienceLevel,
      listenWhen: (previous, current) =>
          current.registerState == BottomState.success,
      listener: (context, state) async {
        if (state.registerState == BottomState.success) {
          showToast(
              text: AppStrings.accountHasBeenCreatedSuccessfully,
              state: ToastStates.success);
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomMaterialButton(
          function: () {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().register(
                    fullName: nameController.text,
                    phoneNumber: phoneNumberController.text,
                    password: passwordController.text,
                    experienceYear: yearExperienceController.text,
                    address: addressController.text,
                    level: state.selectedExperienceLevel!,
                  );
            }
          },
          text: AppStrings.signUp,
          loading: state.registerState == BottomState.loading,
        );
      },
    );
  }
}
