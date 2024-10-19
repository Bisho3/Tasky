import 'package:todo/core/util/app_import.dart';

ServerException handlerError({Response? response, String? statusCode}) {
  return response != null && statusCode == null
      ? ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        )
      : ServerException(
          errorMessageModel:
              ErrorMessageModel(statusMessage: statusCode.toString()),
        );
}
