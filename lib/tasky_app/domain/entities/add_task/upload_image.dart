import 'package:todo/core/util/app_import.dart';

class UploadImage extends Equatable {
  final String imagePath;

  const UploadImage({required this.imagePath});

  @override
  List<Object> get props => [imagePath];
}
