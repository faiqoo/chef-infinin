import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:chef/app.dart';
import 'package:chef/setup.dart';

void main() async {
  await configureDependencies();

  runApp(locateService<App>());
}
