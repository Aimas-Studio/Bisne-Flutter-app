import 'dart:io';

import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_fade_in_image.dart';
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

Widget getShopImage() {
  if (persistentData.shopImagePath.isNotEmpty) {
    return CustomFadeInImage(
        image: FileImage(File(persistentData.shopImagePath)));
  } else if (persistentData.shopImageUrl.isNotEmpty) {
    return CustomFadeInImage(image: NetworkImage(persistentData.shopImageUrl));
  } else {
    return userPlaceHolder;
  }
}
