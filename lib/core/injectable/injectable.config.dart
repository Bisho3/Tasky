// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../account/data/data_source/account_remote_data_source.dart'
    as _i442;
import '../../account/data/repository/account_repository.dart' as _i969;
import '../../account/domain/use_case/profile/get_profile_use_case.dart'
    as _i576;
import '../../account/presentation/controller/account_cubit.dart' as _i981;
import '../../authentication/data/data_source/auth_remote_data_source.dart'
    as _i155;
import '../../authentication/data/repository/auth_repository.dart' as _i171;
import '../../authentication/domain/use_case/log_out/log_out_use_case.dart'
    as _i889;
import '../../authentication/domain/use_case/login/login_use_case.dart' as _i93;
import '../../authentication/domain/use_case/sign_up/sign_up_use_case.dart'
    as _i862;
import '../../authentication/presentation/controller/auth_cubit.dart' as _i607;
import '../../tasky_app/data/data_source/tasky_remote_data_source.dart'
    as _i119;
import '../../tasky_app/data/repository/tasky_repository.dart' as _i868;
import '../../tasky_app/domain/use_case/add_task/add_task_use_case.dart'
    as _i995;
import '../../tasky_app/domain/use_case/add_task/upload_image_use_case.dart'
    as _i759;
import '../../tasky_app/domain/use_case/delete_task/delete_task_usse_case.dart'
    as _i285;
import '../../tasky_app/domain/use_case/task_details/get_task_details_use_case.dart'
    as _i975;
import '../../tasky_app/domain/use_case/tasks/get_tasks_use_case.dart' as _i713;
import '../../tasky_app/presentation/controller/tasky_cubit.dart' as _i845;
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
    gh.lazySingleton<_i442.BaseAccountRemoteDataSource>(
        () => _i442.AccountRemoteDataSource());
    gh.lazySingleton<_i155.BaseAuthRemoteDataSource>(
        () => _i155.AuthRemoteDataSource());
    gh.lazySingleton<_i119.BaseTaskyRemoteDataSource>(
        () => _i119.TaskyRemoteDataSource());
    gh.lazySingleton<_i903.BaseAccountRepository>(
        () => _i969.AccountRepository(gh<_i903.BaseAccountRemoteDataSource>()));
    gh.lazySingleton<_i903.BaseTaskyRepository>(
        () => _i868.TaskyRepository(gh<_i903.BaseTaskyRemoteDataSource>()));
    gh.lazySingleton<_i903.BaseAuthRepository>(
        () => _i171.AuthRepository(gh<_i903.BaseAuthRemoteDataSource>()));
    gh.lazySingleton<_i93.LoginUseCase>(
        () => _i93.LoginUseCase(gh<_i903.BaseAuthRepository>()));
    gh.lazySingleton<_i889.LogOutUseCase>(
        () => _i889.LogOutUseCase(gh<_i903.BaseAuthRepository>()));
    gh.lazySingleton<_i862.SignUpUseCase>(
        () => _i862.SignUpUseCase(gh<_i903.BaseAuthRepository>()));
    gh.lazySingleton<_i995.AddTaskUseCase>(
        () => _i995.AddTaskUseCase(gh<_i903.BaseTaskyRepository>()));
    gh.lazySingleton<_i759.UploadImageUseCase>(
        () => _i759.UploadImageUseCase(gh<_i903.BaseTaskyRepository>()));
    gh.lazySingleton<_i285.DeleteTaskUseCase>(
        () => _i285.DeleteTaskUseCase(gh<_i903.BaseTaskyRepository>()));
    gh.lazySingleton<_i713.GetTaskUseCase>(
        () => _i713.GetTaskUseCase(gh<_i903.BaseTaskyRepository>()));
    gh.lazySingleton<_i975.GetTaskDetailsUseCase>(
        () => _i975.GetTaskDetailsUseCase(gh<_i903.BaseTaskyRepository>()));
    gh.factory<_i845.TaskyCubit>(() => _i845.TaskyCubit(
          gh<_i903.AddTaskUseCase>(),
          gh<_i903.UploadImageUseCase>(),
          gh<_i903.GetTaskUseCase>(),
          gh<_i903.GetTaskDetailsUseCase>(),
          gh<_i903.DeleteTaskUseCase>(),
        ));
    gh.lazySingleton<_i576.ProfileUseCase>(
        () => _i576.ProfileUseCase(gh<_i903.BaseAccountRepository>()));
    gh.factory<_i607.AuthCubit>(() => _i607.AuthCubit(
          gh<_i903.LoginUseCase>(),
          gh<_i903.SignUpUseCase>(),
          gh<_i889.LogOutUseCase>(),
        ));
    gh.factory<_i981.AccountCubit>(
        () => _i981.AccountCubit(gh<_i903.ProfileUseCase>()));
    return this;
  }
}
