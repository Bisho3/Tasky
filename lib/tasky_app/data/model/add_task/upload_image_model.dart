import 'package:todo/core/util/app_import.dart';

class UploadImageModel extends UploadImage {
  const UploadImageModel({required super.imagePath});

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      imagePath: json['image'],
    );
  }
}
