import 'package:todo/core/util/app_import.dart';

class BottomLoginComponent extends StatelessWidget {
  const BottomLoginComponent(
      {super.key,
      required this.phoneNumberController,
      required this.passwordController,
      required this.formKey});

  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.loginState != current.loginState,
      listenWhen: (previous, current) =>
          previous.loginState != current.loginState,
      listener: (context, state) async {
        // TODO: implement listener
        if (state.loginState == BottomState.success) {
          await CacheHelper.saveSecureData(
              value: state.login.token, key: KeyConstance.token);
          AppConstance.token =
              await CacheHelper.getSecureData(key: KeyConstance.token);
          // context.pushAndRemoveUntil(routeName: Routes.bottomNavBarScreen);
        }
      },
      builder: (context, state) {
        return CustomMaterialButton(
          function: () {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().login(
                    phone: phoneNumberController.text,
                    password: passwordController.text,
                  );
            }
          },
          text: AppStrings.login,
          loading: state.loginState == BottomState.loading,
        );
      },
    );
  }
}
