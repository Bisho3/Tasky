part of 'account_cubit.dart';

class AccountState extends Equatable {
  final Profile? profile;
  final String profileFailureMessage;
  final RequestState profileState;

  const AccountState({
    this.profile,
    this.profileFailureMessage = "",
    this.profileState = RequestState.loading,
  });

  AccountState copyWith({
    Profile? profile,
    String? profileFailureMessage,
    RequestState? profileState,
  }) {
    return AccountState(
      profile: profile ?? this.profile,
      profileFailureMessage:
          profileFailureMessage ?? this.profileFailureMessage,
      profileState: profileState ?? this.profileState,
    );
  }

  @override
  List<Object?> get props => [
        profile,
        profileFailureMessage,
        profileState,
      ];
}
