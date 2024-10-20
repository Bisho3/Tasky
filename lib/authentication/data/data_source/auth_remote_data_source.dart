import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

abstract class BaseAuthRemoteDataSource {
  Future<SignUpModel> signUp(SignUpParameter parameter);

  Future<LoginModel> login(LoginParameter parameter);

  Future<LogOutModel> logOut();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<LoginModel> login(LoginParameter parameter) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConstance.loginPath,
        data: {
          "phone": parameter.phone,
          "password": parameter.password,
        },
      );
      if (response.statusCode == AppIntegers.twoHundredAndOne) {
        return LoginModel.fromJson(response.data);
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response!);
    }
  }

  @override
  Future<SignUpModel> signUp(SignUpParameter parameter) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConstance.registerPath,
        data: {
          "phone": parameter.phoneNumber,
          "password": parameter.password,
          "displayName": parameter.fullName,
          "experienceYears": parameter.experienceYear,
          "address": parameter.address,
          "level": parameter.level,
        },
      );
      if (response.statusCode == AppIntegers.twoHundredAndOne) {
        return const SignUpModel();
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response!);
    }
  }

  @override
  Future<LogOutModel> logOut() async {
    try {
      final response = await DioHelper.postData(
        url: ApiConstance.logoutPath,
        token: AppConstance.token,
      );
      if (response.statusCode == AppIntegers.twoHundredAndOne) {
        return const LogOutModel();
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response!);
    }
  }
}
