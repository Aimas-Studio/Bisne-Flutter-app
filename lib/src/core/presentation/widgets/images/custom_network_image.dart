import 'package:bisne/src/core/presentation/themes/place_holders.dart';
import 'package:flutter/material.dart';

ImageProvider customNetworkImage(String url) {
  try {
    final image = NetworkImage(url);
    return image;
  } catch (e) {
    return placeHolderImageApp;
  }
}
