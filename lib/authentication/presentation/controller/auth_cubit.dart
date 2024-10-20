import 'package:injectable/injectable.dart';
import 'package:todo/authentication/domain/use_case/log_out/log_out_use_case.dart';
import 'package:todo/core/util/app_import.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogOutUseCase _logOutUseCase;

  AuthCubit(this._loginUseCase, this._signUpUseCase, this._logOutUseCase)
      : super(const AuthState());

  ///========= country dialog =========///
  void getCountryCode(String countryCode) {
    emit(state.copyWith(countryCode: countryCode));
  }

  ///========== show and hide password login ========///

  void showAndHidePasswordLogin() {
    bool isShow = state.isPasswordObscureLogin;
    IconData suffixIcon = state.suffixIconForPasswordLogin;
    isShow = !isShow;
    suffixIcon =
        isShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(state.copyWith(
        isPasswordObscureLogin: isShow,
        suffixIconForPasswordLogin: suffixIcon));
  }

  ///========= login =========///

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    emit(state.copyWith(loginState: BottomState.loading));
    final result = await _loginUseCase
        .call(LoginParameter(phone: phone, password: password));

    result.fold((failure) {
      emit(state.copyWith(
          loginFailureMessage: failure.message,
          loginState: BottomState.failure));
    }, (login) {
      emit(state.copyWith(login: login, loginState: BottomState.success));
    });
  }

  ///========== choose experience level =========///

  Future<void> chooseExperienceLevel({required String experienceLevel}) async {
    emit(state.copyWith(selectedExperienceLevel: experienceLevel));
  }

  ///========== show and hide password register ========///

  void showAndHidePasswordRegister() {
    bool isShow = state.isPasswordObscureRegister;
    IconData suffixIcon = state.suffixIconForPasswordRegister;
    isShow = !isShow;
    suffixIcon =
        isShow ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(state.copyWith(
        isPasswordObscureRegister: isShow,
        suffixIconForPasswordRegister: suffixIcon));
  }

  ///========= register =========///

  Future<void> register({
    required String fullName,
    required String phoneNumber,
    required String password,
    required String experienceYear,
    required String address,
    required String level,
  }) async {
    emit(state.copyWith(registerState: BottomState.loading));
    final result = await _signUpUseCase.call(SignUpParameter(
        fullName: fullName,
        phoneNumber: phoneNumber,
        password: password,
        experienceYear: experienceYear,
        address: address,
        level: level));

    result.fold((failure) {
      emit(state.copyWith(
          registerFailureMessage: failure.message,
          registerState: BottomState.failure));
    }, (register) {
      emit(state.copyWith(registerState: BottomState.success));
    });
  }

  ///================= logout =================///
  Future<void> logOut() async {
    emit(state.copyWith(
      logoutState: BottomState.loading,
    ));

    final result = await _logOutUseCase.call(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        logoutFailureMessage: failure.message,
        logoutState: BottomState.failure,
      ));
    }, (success) {
      emit(state.copyWith(logoutState: BottomState.success));
    });
  }
}
