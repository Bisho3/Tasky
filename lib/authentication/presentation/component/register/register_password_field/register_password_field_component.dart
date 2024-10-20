import 'package:todo/core/util/app_import.dart';

class RegisterPasswordFieldComponent extends StatelessWidget {
  const RegisterPasswordFieldComponent(
      {super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.isPasswordObscureRegister !=
          current.isPasswordObscureRegister,
      builder: (context, state) {
        return CustomFormField(
          type: TextInputType.visiblePassword,
          controller: passwordController,
          validate: (value) {
            if (value!.isEmpty) {
              return AppStrings.mustEnterYourPassword;
            } else if (value.length < AppIntegers.eight) {
              return AppStrings.passwordIsTooShort;
            }
            return null;
          },
          text: AppStrings.password,
          isPassword: state.isPasswordObscureRegister,
          suffixIcon: state.suffixIconForPasswordRegister,
          suffixOnPressed: () {
            context.read<AuthCubit>().showAndHidePasswordRegister();
          },
        );
      },
    );
  }
}
