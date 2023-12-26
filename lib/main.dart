import 'package:clean_architecture/injection_container.dart' as di;
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const QouteApp());
}
