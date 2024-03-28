import 'dart:io';

import 'package:bisne/src/core/presentation/widgets/images/custom_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../../../core/presentation/themes/themes_export.dart';
import '../../../../core/presentation/widgets/widgets_export.dart';
import '../../domain/entities/user.dart';

final _persistentData = PersistentData();

User getUserInfo() {
  return User(
    id: _persistentData.idUser,
    username: _persistentData.userName,
    email: _persistentData.userEmail,
  );
}

Widget getUserImage() {
  if (_persistentData.userImagePath.isNotEmpty) {
    return CustomFadeInImage(
        image: FileImage(File(_persistentData.userImagePath)));
  } else if (_persistentData.userImageUrl.isNotEmpty) {
    return CustomFadeInImage(
        image: customNetworkImage(_persistentData.userImageUrl));
  } else {
    return userPlaceHolder;
  }
}
