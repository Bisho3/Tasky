import 'package:todo/core/util/app_import.dart';

class TextFailureRegisterComponent extends StatelessWidget {
  const TextFailureRegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.registerState != current.registerState,
      builder: (context, state) {
        if (state.registerState == BottomState.failure) {
          return CustomFailureText(failureText: state.registerFailureMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
