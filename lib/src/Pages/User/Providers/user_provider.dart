import 'package:flutter/material.dart';

import '../../../Utils/shared_persistent_data.dart';

final PersistentData _persistentData = PersistentData();

String getUsername() {
  return _persistentData.username;
}

String getUserEmail() {
  return _persistentData.userEmail;
}

//Pending : save and read images from local storage in app
ImageProvider getProfilePicture() {
  return AssetImage(profilePictureUrl);
}

int getNotificationCount() {
  return 1;
}

String profilePictureUrl = "assets/Images/photo.png";
