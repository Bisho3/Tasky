// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../authentication/data/data_source/auth_remote_data_source.dart'
    as _i155;
import '../../authentication/data/repository/auth_repository.dart' as _i171;
import '../../authentication/domain/use_case/login/login_use_case.dart' as _i93;
import '../../authentication/domain/use_case/sign_up/sign_up_use_case.dart'
    as _i862;
import '../../authentication/presentation/controller/auth_cubit.dart' as _i607;
import '../util/app_import.dart' as _i903;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i155.BaseAuthRemoteDataSource>(
        () => _i155.AuthRemoteDataSource());
    gh.lazySingleton<_i903.BaseAuthRepository>(
        () => _i171.AuthRepository(gh<_i903.BaseAuthRemoteDataSource>()));
    gh.lazySingleton<_i93.LoginUseCase>(
        () => _i93.LoginUseCase(gh<_i903.BaseAuthRepository>()));
    gh.lazySingleton<_i862.SignUpUseCase>(
        () => _i862.SignUpUseCase(gh<_i903.BaseAuthRepository>()));
    gh.factory<_i607.AuthCubit>(() => _i607.AuthCubit(
          gh<_i903.LoginUseCase>(),
          gh<_i903.SignUpUseCase>(),
        ));
    return this;
  }
}
