import 'package:todo/core/util/app_import.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AccountCubit>()..getProfile(),
      child: Scaffold(
        appBar: const CustomAppBar(
          leading: CustomBack(),
          textTitle: AppStrings.profile,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.all(AppDouble.fifteen.w),
          child: BlocBuilder<AccountCubit, AccountState>(
            buildWhen: (previous, current) =>
                previous.profileState != current.profileState,
            builder: (context, state) {
              switch (state.profileState) {
                case RequestState.loading:
                  return LoadingProfileComponent();

                case RequestState.success:
                  return Column(
                    children: [
                      CardItemComponent(
                        ask: AppStrings.name,
                        answer: state.profile!.name,
                      ),
                      verticalSpace(AppDouble.ten),
                      CardItemComponent(
                        ask: AppStrings.phone,
                        answer: state.profile!.phone,
                        wantCopy: true,
                      ),
                      verticalSpace(AppDouble.ten),
                      CardItemComponent(
                        ask: AppStrings.level,
                        answer: state.profile!.level,
                      ),
                      verticalSpace(AppDouble.ten),
                      CardItemComponent(
                        ask: AppStrings.yearOfExperience,
                        answer: state.profile!.yearExperience.toString(),
                      ),
                      verticalSpace(AppDouble.ten),
                      CardItemComponent(
                        ask: AppStrings.address,
                        answer: state.profile!.address,
                      ),
                    ],
                  );

                case RequestState.failure:
                  return Center(
                    child: CustomFailureText(
                      failureText: state.profileFailureMessage,
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
