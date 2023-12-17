import 'dart:typed_data';

class HomeScreenModel {
  HomeScreenModel({
    this.projectName = '',
    this.customerName = '',
    this.customerLogo = '',
    this.customerImage,
  });

  final String projectName;
  final String customerName;
  final String customerLogo;
  final Uint8List? customerImage;
}
