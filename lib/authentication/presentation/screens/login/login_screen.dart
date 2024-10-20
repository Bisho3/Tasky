import 'package:todo/core/util/app_import.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(AppImages.enterTasksImage),
              BodyLoginComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
