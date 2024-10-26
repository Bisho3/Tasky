import 'package:todo/core/util/app_import.dart';

class LoginPasswordFieldComponent extends StatelessWidget {
  const LoginPasswordFieldComponent(
      {super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.isPasswordObscureLogin != current.isPasswordObscureLogin,
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
          isPassword: state.isPasswordObscureLogin,
          suffixIcon: state.suffixIconForPasswordLogin,
          suffixOnPressed: () {
            context.read<AuthCubit>().showAndHidePasswordLogin();
          },
        );
      },
    );
  }
}
