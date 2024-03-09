import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/entities/user.dart';

final persistentData = PersistentData();

User getUserInfo() {
  return User(
    id: persistentData.idUser,
    username: persistentData.userName,
    email: persistentData.userEmail,
  );
}

Widget getUserImage() {
  if (persistentData.userImagePath.isNotEmpty) {
    return CustomFadeInImage(
        image: FileImage(File(persistentData.userImagePath)));
  } else if (persistentData.userImageUrl.isNotEmpty) {
    return CustomFadeInImage(image: NetworkImage(persistentData.userImageUrl));
  } else {
    return userPlaceHolder;
  }
}
