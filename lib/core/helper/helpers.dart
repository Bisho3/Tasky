import 'package:todo/core/util/app_import.dart';

abstract class CustomCheckPhoneNumber {
  static bool validNumberPhone(String phoneNumber) {
    final frPhone1 = PhoneNumber.parse(
      phoneNumber,
    );
    final valid = frPhone1.isValid();
    final validMobile = frPhone1.isValid(
      type: PhoneNumberType.mobile,
    );

    return valid && validMobile;
  }
}

void customCopyText({
  required String text,
}) {
  Clipboard.setData(
    ClipboardData(text: text),
  ).then((value) {
    showToast(
      text: AppStrings.copied,
      state: ToastStates.success,
    );
  });
}

Future<bool> refreshToken() async {
  try {
    final refreshTokenResponse = await DioHelper.getData(
      url: ApiConstance.refreshTokenPath,
      token: AppConstance.token,
      query: {
        'token': AppConstance.refreshToken,
      },
    );

    if (refreshTokenResponse.statusCode == AppIntegers.twoHundred) {
      CacheHelper.saveSecureData(
        key: KeyConstance.token,
        value: refreshTokenResponse.data['access_token'],
      );
      AppConstance.token = refreshTokenResponse.data['access_token'];
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
