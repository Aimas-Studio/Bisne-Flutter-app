import 'package:flutter/material.dart';

String getUsername() {
  return "Jane Doe";
}

String getUserEmail() {
  return "testemail@gmail.com";
}

ImageProvider getProfilePicture() {
  return AssetImage(profilePictureUrl);
}

String profilePictureUrl = "assets/Images/photo.png";

int getNotificationCount() {
  return 1;
}
