import 'package:todo/core/util/app_import.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;

  const ErrorMessageModel({
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusMessage: json["message"] ?? json["description"],
    );
  }

  @override
  List<Object?> get props => [statusMessage];

  @override
  bool get stringify => true;
}
