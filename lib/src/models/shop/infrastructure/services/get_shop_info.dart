import 'dart:io';

import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:bisne/src/core/presentation/widgets/images/custom_fade_in_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/infrastructure/persistent data/shared_persistent_data.dart';
import '../../domain/entities/shop_entity.dart';

final _persistentData = PersistentData();

Shop getShopInfo() {
  return Shop(
      manageId: _persistentData.shopAdminId,
      municipality: _persistentData.shopRegion,
      region: _persistentData.shopMunicipality,
      id: _persistentData.shopId,
      name: _persistentData.shopName,
      description: _persistentData.description,
      imageUrl: _persistentData.shopImageUrl,
      category: _persistentData.shopCategory);
}

Widget getShopImage() {
  if (_persistentData.shopImagePath.isNotEmpty) {
    return CustomFadeInImage(
        image: FileImage(File(_persistentData.shopImagePath)));
  } else if (_persistentData.shopImageUrl.isNotEmpty) {
    return CustomFadeInImage(image: NetworkImage(_persistentData.shopImageUrl));
  } else {
    return userPlaceHolder;
  }
}
