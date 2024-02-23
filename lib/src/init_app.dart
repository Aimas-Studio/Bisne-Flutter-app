import 'package:flutter/material.dart';

import 'core/utils/shared_persistent_data.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appData = PersistentData();
  await appData.loadData();
}
