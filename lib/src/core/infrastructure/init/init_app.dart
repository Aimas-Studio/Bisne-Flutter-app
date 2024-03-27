import 'package:flutter/material.dart';

import '../../domain/services/get_category.dart';
import '../persistent data/shared_persistent_data.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appData = PersistentData();
  await appData.loadData();
  try {
    if (await getCategories()) {
      print('Categories charged');
    }
  } catch (error) {
    print('There was an error charging categories');
  }
}

const DEBUG = false;

const USERID = 'VXN1YXJpb19SZWdpc3RyYWRvCmk0';
