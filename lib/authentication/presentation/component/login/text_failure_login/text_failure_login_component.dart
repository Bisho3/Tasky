import 'package:todo/core/util/app_import.dart';

class TextFailureLoginComponent extends StatelessWidget {
  const TextFailureLoginComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.loginState != current.loginState,
      builder: (context, state) {
        if (state.loginState == BottomState.failure) {
          return CustomFailureText(failureText: state.loginFailureMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
