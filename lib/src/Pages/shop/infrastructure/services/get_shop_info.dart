import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/entities/shop_entity.dart';

final persistentData = PersistentData();

Shop getShopInfo() {
  return Shop(
    id: 1,
    shopName: persistentData.shopName,
    shopDescription: persistentData.shopDescription,
    imageUrl: '',
  );
}

ImageProvider getShopImage() {
  if (persistentData.shopImagePath.isNotEmpty) {
    return FileImage(File(persistentData.shopImagePath));
  } else {
    //TODO save in local storage again the shop image
    return NetworkImage(persistentData.shopImageUrl);
  }
}
