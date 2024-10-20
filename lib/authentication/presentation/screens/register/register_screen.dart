import 'package:todo/core/util/app_import.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _yearsOfExperienceController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          leading: CustomBack(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.all(AppDouble.twenty.h),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.enterTasksImage,
                  height: AppIntegers.twoHundred.h,
                ),
                verticalSpace(AppDouble.ten),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    AppStrings.signUp,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpace(AppDouble.five),
                RegisterNameFieldComponent(
                  nameController: _fullNameController,
                ),
                verticalSpace(AppDouble.five),
                RegisterPhoneFieldComponent(
                  phoneNumberController: _phoneNumberController,
                ),
                verticalSpace(AppDouble.five),
                RegisterYourExperienceFieldComponent(
                  yearsOfExperienceController: _yearsOfExperienceController,
                ),
                verticalSpace(AppDouble.five),
                const ChooseExperienceLevelComponent(),
                verticalSpace(AppDouble.five),
                RegisterAddressFieldComponent(
                  addressController: _addressController,
                ),
                verticalSpace(AppDouble.five),
                RegisterPasswordFieldComponent(
                  passwordController: _passwordController,
                ),
                const TextFailureRegisterComponent(),
                verticalSpace(AppDouble.five),
                BottomRegisterComponent(
                  passwordController: _passwordController,
                  addressController: _addressController,
                  phoneNumberController: _phoneNumberController,
                  nameController: _fullNameController,
                  formKey: _formKey,
                  yearExperienceController: _yearsOfExperienceController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
