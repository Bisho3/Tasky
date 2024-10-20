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
