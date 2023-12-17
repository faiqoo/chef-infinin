import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan/scan.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => SystemChrome.setPreferredOrientations([]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScanController();
    return Scaffold(
      body: ScanView(
        controller: controller,
        onCapture: (data) {
          Navigator.pop(context, data);
        },
      ),
    );
  }
}
