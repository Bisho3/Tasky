import 'package:todo/core/util/app_import.dart';

class BodyLoginComponent extends StatelessWidget {
  BodyLoginComponent({super.key});

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(
        AppDouble.fifteen.w,
      ),
      child: Form(
        key: _formKey,
        onWillPop: () async => false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.login,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
            verticalSpace(AppDouble.ten),
            LoginPhoneFieldComponent(
              phoneNumberController: _phoneNumberController,
            ),
            verticalSpace(AppDouble.five),
            LoginPasswordFieldComponent(
                passwordController: _passwordController),
            const TextFailureLoginComponent(),
            verticalSpace(AppDouble.ten),
            BottomLoginComponent(
              phoneNumberController: _phoneNumberController,
              passwordController: _passwordController,
              formKey: _formKey,
            ),
            verticalSpace(AppDouble.twenty),
            const TextSignUpHereComponent(),
          ],
        ),
      ),
    );
  }
}
