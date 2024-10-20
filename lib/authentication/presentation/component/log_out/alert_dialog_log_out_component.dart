import 'package:todo/core/util/app_import.dart';

void showSignOutDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: AlertDialog(
          title: Text(
            AppStrings.confirmLogout,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            AppStrings.areYouSureYouWantLogOut,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(AppStrings.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) =>
                  previous.logoutState != current.logoutState,
              listenWhen: (previous, current) =>
                  current.logoutState == BottomState.success,
              listener: (context, state) {
                if (state.logoutState == BottomState.success) {
                  showToast(
                      text: AppStrings.successfullySignOut,
                      state: ToastStates.success);
                  context.pushAndRemoveUntil(routeName: Routes.loginScreen);
                  CacheHelper.removeSecureData(key: KeyConstance.token);
                  CacheHelper.removeSecureData(key: KeyConstance.refreshToken);
                  AppConstance.token = null;
                  AppConstance.refreshToken = null;
                }
              },
              builder: (context, state) {
                return TextButton(
                  child: const Text(
                    AppStrings.signOut,
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().logOut();
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
