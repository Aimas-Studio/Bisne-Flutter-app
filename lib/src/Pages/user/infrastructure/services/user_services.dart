import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/entities/user.dart';

final persistentData = PersistentData();

User getUserInfo() {
  return User(
    id: persistentData.idUser,
    username: persistentData.userName,
    email: persistentData.userEmail,
    imageUrl: persistentData.userImagePath,
  );
}

ImageProvider getUserImage() {
  if (persistentData.userImagePath.isNotEmpty) {
    return FileImage(File(persistentData.userImagePath));
  } else {
    //TODO save in local storage again the user image
    return NetworkImage(persistentData.userImageUrl);
  }
}
