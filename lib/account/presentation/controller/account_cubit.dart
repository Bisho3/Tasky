import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  final ProfileUseCase _profileUseCase;

  AccountCubit(this._profileUseCase) : super(const AccountState());

  ///============= get profile ==============///
  Future<void> getProfile() async {
    final result = await _profileUseCase.call(const NoParameters());
    result.fold(
        (failure) => emit(state.copyWith(
            profileState: RequestState.failure,
            profileFailureMessage: failure.message)),
        (profile) => emit(state.copyWith(
            profileState: RequestState.success, profile: profile)));
  }
}
