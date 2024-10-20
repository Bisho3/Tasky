import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

abstract class BaseAccountRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseAccountRemoteDataSource)
class AccountRemoteDataSource extends BaseAccountRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.profilePath,
        token: AppConstance.token,
      );
      if (response.statusCode == AppIntegers.twoHundred) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response!);
    }
  }
}
