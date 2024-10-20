part of 'auth_cubit.dart';

class AuthState extends Equatable {
  ///========= country dialog =========///
  final String countryCode;

  final bool isPasswordObscureLogin;

  final IconData suffixIconForPasswordLogin;

  final Login login;
  final String loginFailureMessage;
  final BottomState loginState;

  final List<String> experienceLevel;
  final String? selectedExperienceLevel;
  final bool isPasswordObscureRegister;

  final IconData suffixIconForPasswordRegister;

  final String registerFailureMessage;
  final BottomState registerState;

  final BottomState logoutState;
  final String logoutFailureMessage;

  const AuthState({
    this.countryCode = "",
    this.isPasswordObscureLogin = true,
    this.suffixIconForPasswordLogin = Icons.visibility_outlined,
    this.login = const Login(token: "", refreshToken: ""),
    this.loginFailureMessage = "",
    this.loginState = BottomState.isInitial,
    this.experienceLevel = const [
      "senior",
      "junior",
      "mid",
      "beginner",
      "expert",
      "master",
      "grandmaster",
      "pro"
    ],
    this.selectedExperienceLevel,
    this.isPasswordObscureRegister = true,
    this.suffixIconForPasswordRegister = Icons.visibility_outlined,
    this.registerFailureMessage = "",
    this.registerState = BottomState.isInitial,
    this.logoutState = BottomState.isInitial,
    this.logoutFailureMessage = "",
  });

  AuthState copyWith({
    String? countryCode,
    bool? isPasswordObscureLogin,
    IconData? suffixIconForPasswordLogin,
    Login? login,
    String? loginFailureMessage,
    BottomState? loginState,
    List<String>? experienceLevel,
    String? selectedExperienceLevel,
    bool? isPasswordObscureRegister,
    IconData? suffixIconForPasswordRegister,
    BottomState? registerState,
    String? registerFailureMessage,
    BottomState? logoutState,
    String? logoutFailureMessage,
  }) {
    return AuthState(
      countryCode: countryCode ?? this.countryCode,
      isPasswordObscureLogin:
          isPasswordObscureLogin ?? this.isPasswordObscureLogin,
      suffixIconForPasswordLogin:
          suffixIconForPasswordLogin ?? this.suffixIconForPasswordLogin,
      login: login ?? this.login,
      loginFailureMessage: loginFailureMessage ?? this.loginFailureMessage,
      loginState: loginState ?? this.loginState,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      selectedExperienceLevel:
          selectedExperienceLevel ?? this.selectedExperienceLevel,
      isPasswordObscureRegister:
          isPasswordObscureRegister ?? this.isPasswordObscureRegister,
      suffixIconForPasswordRegister:
          suffixIconForPasswordRegister ?? this.suffixIconForPasswordRegister,
      registerState: registerState ?? this.registerState,
      registerFailureMessage:
          registerFailureMessage ?? this.registerFailureMessage,
      logoutState: logoutState ?? this.logoutState,
      logoutFailureMessage: logoutFailureMessage ?? this.logoutFailureMessage,
    );
  }

  @override
  List<Object?> get props => [
        countryCode,
        isPasswordObscureLogin,
        suffixIconForPasswordLogin,
        login,
        loginFailureMessage,
        loginState,
        experienceLevel,
        selectedExperienceLevel,
        isPasswordObscureRegister,
        suffixIconForPasswordRegister,
        registerState,
        registerFailureMessage,
        logoutState,
        logoutFailureMessage
      ];
}
